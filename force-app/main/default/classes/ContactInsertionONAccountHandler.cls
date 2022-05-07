public class ContactInsertionONAccountHandler {
    
    public static void createContactUponAccInsertion(Map<Id, Account> accountMap){
        
		List<Contact> conList = new List<Contact>();
		List<Account> acctList = [Select Id, Name from Account Where Id IN:accountMap.keySet() ];
        
        for(Account acc : acctList){ // ABC  // BCD 
            //acc.Active__c
            Contact con = new Contact();
            con.FirstName = acc.Name;  //Test 
            con.LastName = acc.Name;
            con.Email = 'defaultemail@gmail.com';
            con.AccountId = acc.Id;
            conList.add(con);
        }
        //DML  CRUD
        if(conList.size()>0){
            insert conList;
        }
    }
    
    /*public static void updateContactNameOnAccNameUpdation(List<Account> accList, Map<Id,Account> oldAccMap){
        
		Set<Id> accountIds = new Set<Id>();
        for(Account acc : accList){
            account oldAccnt = oldAccMap.get(acc.Id);
            if(acc.Name != oldAccnt.Name){
                accountIds.add(acc.Id);
            }
        }
        
        if(accountIds.size() > 0){
            Map<Id, Account> accountMap = new Map<Id, Account>([Select Id, Name, (Select Id, LastName from Contacts) from Account Where Id IN:accountIds ]);
            List<Contact> conList = new List<Contact>();
            
            for(Account acc : accList){
                account oldAccnt = oldAccMap.get(acc.Id);
                if(acc.Name != oldAccnt.Name){
                    if(accountMap.containsKey(acc.Id)){
                        Account accnt = accountMap.get(acc.Id);
                        List<Contact> lstCont = accnt.contacts;
                        for(Contact con : lstCont){
                            con.LastName = acc.Name;
							conList.add(con);
                        }
                    }
				}
            }
            if(!conList.isEmpty()){
                update conList;
            }
        }
    }
    
    */
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}