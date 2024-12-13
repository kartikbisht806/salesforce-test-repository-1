trigger Contact_To_Account on Contact (after insert, after update, after delete, after undelete) {
    Switch on Trigger.operationType{
        
        when AFTER_INSERT{
            Set<Id> accIdsToUpdate = new Set<Id>();
            Map<Id, String> accountContactMap = new Map<Id, string>();
                for(Contact con : Trigger.new){
                    if(con.AccountId != null){
                        accIdsToUpdate.add(con.AccountId);
                        String conLastname = '';
                        
                        String str = accountContactMap.containsKey(con.AccountId) ? accountContactMap.get(con.AccountId) + con.lastName : con.lastname;
                        
                        accountContactMap.put(con.AccountId, conLastname);
                    }
                    }
                List<Account> accountsToUpdate = [SELECT Id, Name FROM Account Where Id IN : accIdsToUpdate];
                
                for(Account acc : accountsToUpdate){
                    if(accountContactMap.containsKey(acc.Id)){
                        acc.Name = acc.name + ' ' + accountContactMap.get(acc.Id);
                    }
                }

                update accountsToUpdate;
                }

        when AFTER_UPDATE{
            Set<Id> accIdsToUpdate = new Set<Id>();
                for(Contact con : Trigger.new){
                    if(con.AccountId != null){
                        if(Trigger.oldMap.get(con.Id).Lastname != con.Lastname){
                            //condition when update to happen
                            accIdsToUpdate.add(con.AccountId);

                        }else if(Trigger.oldMap.get(con.Id).AccountId != con.AccountId){
                            //2nd condition when update to happen
                            accIdsToUpdate.add(con.AccountId);
                            accIdsToUpdate.add(Trigger.oldMap.get(con.Id).AccountId);
                        }
                    }
                    }
                List<Account> accountsToUpdate = [SELECT Id, Name FROM Account Where Id IN : accIdsToUpdate];
                Map<Id, String> latestContactNameMap = new Map<Id, string>();
                Map<Id, String> oldContactNameMap = new Map<Id, string>();
                for(Contact con : Trigger.new){
                    if(con.AccountId != null){
                        latestContactNameMap.put(con.AccountId, con.LastName);
                    }
                }
                for(Contact con : trigger.old){
                    if(con.AccountId != null){
                        oldContactNameMap.put(con.AccountId, con.LastName);
                    }
                }
                for(Account acc : accountsToUpdate){
                    if(latestContactNameMap.containsKey(acc.Id)){
                        acc.Name = acc.Name.remove(oldContactNameMap.get(acc.Id));
                        acc.Name = acc.name + ' ' + latestContactNameMap.get(acc.Id);
                    }
                }

                update accountsToUpdate;

                
        }

        when AFTER_DELETE{
            Set<Id> accIdsToUpdate = new Set<Id>();
                for(Contact con : Trigger.old){
                    if(con.AccountId != null){
                        accIdsToUpdate.add(con.AccountId);
                    }
                    }
                List<Account> accountsToUpdate = [SELECT Id, Name FROM Account Where Id IN : accIdsToUpdate];
                Map<Id, String> latestContactNameMap = new Map<Id, string>();
                for(Contact con : Trigger.old){
                    if(con.AccountId != null){
                        latestContactNameMap.put(con.AccountId, con.LastName);
                    }
                }
                for(Account acc : accountsToUpdate){
                    if(latestContactNameMap.containsKey(acc.Id)){
                        acc.Name = acc.name.remove(latestContactNameMap.get(acc.Id));
                    }
                }

                update accountsToUpdate;
        }

        

        when AFTER_UNDELETE{
            Set<Id> accIdsToUpdate = new Set<Id>();
                for(Contact con : Trigger.new){
                    if(con.AccountId != null){
                        accIdsToUpdate.add(con.AccountId);
                    }
                    }
                List<Account> accountsToUpdate = [SELECT Id, Name FROM Account Where Id IN : accIdsToUpdate];
                Map<Id, String> latestContactNameMap = new Map<Id, string>();
                for(Contact con : Trigger.new){
                    if(con.AccountId != null){
                        latestContactNameMap.put(con.AccountId, con.LastName);
                    }
                }
                for(Account acc : accountsToUpdate){
                    if(latestContactNameMap.containsKey(acc.Id)){
                        acc.Name = acc.name + ' ' + latestContactNameMap.get(acc.Id);
                    }
                }

                update accountsToUpdate;
                }
        }
    
}