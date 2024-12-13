public class Lead_Trigger_Handler {
    public static void before_Insert_Handler(List<Lead> newRecords){
        for(lead lead : newRecords){
            if(String.isBlank(lead.Rating)){
                lead.Rating = 'Warm';
            }
            
            if(String.isBlank(lead.Industry)){
                lead.addError('Industry Field cannot be blank : TestLeadTrigger!');
            }
        }
    }
    
    
    //Static variable
    public static boolean triggerExecuted = false;
    
    public static void after_Insert_Handler(List<Lead> newRecords){
        List<Task> assossicated_Tasks_list = new List<Task>();
        for(lead lead : newRecords){
            Task newTask = new Task(Subject='Follow up Task on Lead creation', whoId = lead.Id, ownerId = lead.OwnerId);
            assossicated_Tasks_list.add(newTask);
        }
        insert assossicated_Tasks_list;
        
        //Inserting another Lead record, This will call the trigger recursively
        // Adding debugging statement
        System.debug('Before checking triggerExecuted: ' + Lead_Trigger_Handler.triggerExecuted);
        
        if(!Lead_Trigger_Handler.triggerExecuted){
            Lead_Trigger_Handler.triggerExecuted = true;
            
            // Adding debugging statement 
            System.debug('Trigger executed first time, inserting another lead');
            
            Lead anotherLead = new Lead(
                LastName = 'New Test Lead Single',
                Company = 'Caelius Consulting',
                Status = 'Open - Not Contacted',
                LeadSource = 'Web',
                CurrencyIsoCode = 'INR',
                Industry = 'Agriculture',
                RecordTypeId = '012dM0000039SmXQAU');
        insert anotherLead;
            // Adding debugging statement 
            System.debug('Another lead inserted: ' + anotherLead);
        }
        
    }
    
    public static void before_Update_Handler(List<Lead> newRecords, Map<Id, Lead> oldRecordsMap){
        for(lead lead : newRecords){
            if((lead.Status == 'Closed - Converted' || lead.Status == 'Closed - Not Converted') && oldRecordsMap.get(lead.Id).Status == 'Open - Not Contacted'){
                lead.Status.addError('You cannot directly close lead from Open Status!');
            }
        }
    }
}