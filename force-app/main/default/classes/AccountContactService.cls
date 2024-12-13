public with sharing class AccountContactService {
    public static void accounts_update(Set<Id> accountIdsSet) {
        List<Account> accountsToUpdate = new List<Account>();
                List<AggregateResult> resultList = [Select AccountId, COUNT(Id) totalContacts 
                                                    FROM Contact 
                                                    WHERE Active__c = true AND AccountId IN: accountIdsSet 
                                                    GROUP BY AccountId];
                    for(AggregateResult res : resultList){
                        String accId = String.valueOf(res.get('AccountId'));
                        Integer totalCount = Integer.valueOf(res.get('totalContacts'));

                        Account acc = new Account(Id=accId, Active_Contacts__c=totalCount);
                        accountsToUpdate.add(acc);
                    }
                    update accountsToUpdate;
    }
}