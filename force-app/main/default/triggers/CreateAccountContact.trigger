trigger CreateAccountContact on Account (after insert, after update, before delete) {
    List<Contact> contList = new List<Contact>();
    if(Trigger.isInsert){        
        for(Account acc : Trigger.New){
            Contact con = new Contact(LastName = acc.Name, 
                                 AccountId = acc.Id,
                                 Phone = acc.Phone);
            contList.add(con);
        }
        insert contList;
    }
    
    Set<Id> accIds = new Set<Id>();
    if(Trigger.isUpdate){
        for(Account acc : Trigger.New){
            if(acc.Phone != trigger.oldMap.get(acc.Id).Phone){
                accIds.add(acc.Id);
            }
        }
        if(accIds.size()>0){
            Map<Id,Account> mapAcc = new Map<Id,Account>([Select Id, Phone, (Select Id, Phone from Contacts) from Account where Id IN:accIds]);
            List<Contact> contToUpdate = new List<Contact>();
            for(Account acc: Trigger.New){
                if(acc.Phone != trigger.oldMap.get(acc.Id).Phone){
                    if(mapAcc.containsKey(acc.Id)){
                        Account accObj = mapAcc.get(acc.Id);
                        List<Contact> listCont = accObj.Contacts;
                        for(Contact con : listCont){
                            con.Phone = acc.Phone;
                            contToUpdate.add(con);
                        }
                    }
                }   
            }
            if(contToUpdate.size()>0){
                update contToUpdate;
                System.debug('Updated>>>>>>>>'+contToUpdate);
            }
        }
    }
    
    if(Trigger.isDelete){
        Set<Id> accIds = new Set<Id>();    
        for(Account acc : Trigger.old){
            accIds.add(acc.Id);
        }
        
        Map<Id, Account> accMap = new Map<Id,Account>([Select Id, (Select Id from Contacts) from Account where Id IN: accIds]);
        //Map<AggregateResult> mapResult = [Select count(Id) cid from Contact where AccountId IN: accIds ];
        for(Account acc : Trigger.Old){
            if(accMap.get(acc.Id).contacts.size()>2){
                acc.addError('Could not delete Account because Account having more than 2 Contacts');
            }
        }
    }

    
}










/*
Trigger AccountAndContCreation on Account(after insert){
    if(Trigger.isInsert){
        List<Contact> contList = new List<Contact>();
        for(Account acc : Trigger.New){
            Contact con = new Contact (AccountId = acc.Id, Phone= acc.Phone, LastName = acc.Name);
            contList.add(con);
        }
        insert contList;
        }
    }
        
}
*/