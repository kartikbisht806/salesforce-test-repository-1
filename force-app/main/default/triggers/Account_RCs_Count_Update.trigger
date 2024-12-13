trigger Account_RCs_Count_Update on Contact (after insert, after update, after delete, after undelete) {
    set<Id> accountIds = new set<Id>();
    
    if(Trigger.isInsert || Trigger.isUpdate || Trigger.isUndelete){
        for(Contact con : Trigger.new){
            if(con.AccountId != null){
                accountIds.add(con.AccountId);
            }
        }
    }
    
    if(Trigger.isUpdate || Trigger.isDelete){
        for(Contact con : Trigger.old){
            if(con.AccountId != null){
                accountIds.add(con.AccountId);
            }
        }
    }
    
    
    List<Account> accountsToUpdate = new List<Account>();
    for(Account acc: [SELECT id,(SELECT Id, Active__c FROM Contacts WHERE Active__c = true) FROM Account WHERE Id IN : accountIds]){
        acc.Active_Contacts__c = acc.Contacts.size();
        accountsToUpdate.add(acc);
    }
    
    if(!accountsToUpdate.isEmpty()){
        update accountsToUpdate;
    }
    
}