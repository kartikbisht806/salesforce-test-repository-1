public with sharing class Contact_Trigger_Handler {
    public static void after_insert(List<Contact> currentContact){
        Set<Id> accountIdsSet = new Set<Id>();
                for(Contact con : currentContact){
                    if(String.isNotBlank(con.AccountId)){
                        accountIdsSet.add(con.AccountId);
                    }
                    
                }
                AccountContactService.accounts_update(accountIdsSet);
    }

    public static void after_update(List<Contact> currentContact, Map<Id, Contact> oldContactMap){
        Set<Id> accountIdsSet = new Set<Id>();
                for(Contact con : currentContact){
                    //Situations of updation:
                    // 1.) Checkbox is checked from uncheck or vice-a-versa.
                    if(String.isNotBlank(con.AccountId) && oldContactMap.get(con.Id).Active__c != con.Active__c){
                        accountIdsSet.add(con.AccountId);
                    }
                    // 2.) Account is changed.
                    if(oldContactMap.get(con.Id).AccountId != con.AccountId){
                        accountIdsSet.add(con.AccountId);
                        accountIdsSet.add(oldContactMap.get(con.Id).AccountId);
                    }
                    
                }
                AccountContactService.accounts_update(accountIdsSet);
    }

    public static void after_delete(List<Contact> oldContacts){
                Set<Id> accountIdsSet = new Set<Id>();
                for(Contact con : oldContacts){
                    if(String.isNotBlank(con.AccountId)){
                        accountIdsSet.add(con.AccountId);
                    }
                }
                AccountContactService.accounts_update(accountIdsSet);
    }

    public static void after_undelete(List<Contact> newContacts){
        Set<Id> accountIdsSet = new Set<Id>();
        for(Contact con : newContacts){
            if(String.isNotBlank(con.AccountId)){
                accountIdsSet.add(con.AccountId);
            }
        }
        AccountContactService.accounts_update(accountIdsSet);
}
}