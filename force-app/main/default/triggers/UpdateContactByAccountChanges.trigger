trigger UpdateContactByAccountChanges on Account (after update) {
    Set<Id> accIds = new Set<Id>();
   
    for(Account acc: Trigger.New){
        //Account oldAcc = trigger.oldMap(acc.Id);
        if(acc.Phone != trigger.oldMap.get(acc.Id).Phone){
            accIds.add(acc.Id);
        }
    }
    if(accIds.size()>0){
        Map<Id,Account> mapAcc = new Map<Id,Account>([Select Id,Phone, (select Id, Phone from Contacts) from Account where Id IN:accIds]);
        Map<Id,Contact> mapConts = new Map<Id,Contact>([Select Id, AccountId from Contact where AccountId IN:accIds ]);    
        
        List<Contact> contsTobeUpdated = new List<Contact>();
        for(Account acc : Trigger.New){
            //Account oldAcc = trigger.oldMap(acc.Id);
            if(acc.Phone != trigger.oldMap.get(acc.Id).Phone){
                if(mapAcc.containsKey(acc.Id)){
                    Account accObj = mapAcc.get(acc.Id);
                    List<Contact> lstCon = accObj.Contacts;
                    for(Contact cont : lstCon){
                        cont.Phone = acc.Phone;
                        contsTobeUpdated.add(cont);
                    }
                }
            }
        }
        if(contsTobeUpdated.size()>0){
            update contsTobeUpdated;
        }
    }
}