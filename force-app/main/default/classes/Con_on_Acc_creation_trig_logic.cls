public with sharing class Con_on_Acc_creation_trig_logic {
    public static void createContact(List<Account> accList) {
        List<Contact> conList = new List<Contact>();
            for(Account acc : accList){
                Contact con = new Contact(LastName = 'Default Contact Created', 
                                            AccountId = acc.Id, 
                                            Number_of_Family_Members__c = 2);
                conList.add(con);
            }
            Insert conList;
    }
}