public class ContactTriggerDemoHandler {
    public static void checkingDupContacts(List<Contact> triggerNew){
        Set<Id> AccountIds = new Set<Id>();
        Set<String> nameSet = new Set<String>();
        Set<String> emailSet = new Set<String>();
        List<Contact> contList = new  List<Contact>();
        
        for(Contact con: triggerNew){
            if(con.AccountId!=null && con.FirstName!=null && con.Email!=null){
                AccountIds.add(con.AccountId);
                nameSet.add(con.FirstName);
                emailSet.add(con.Email);
            }        
        }
        
        for(Contact con: [Select Id, FirstName,Email,AccountId from Contact where AccountId =:AccountIds AND 
                          FirstName =:nameSet AND Email =:emailSet]){
                              contList.add(con);
                          }
        for(Contact con: triggerNew){
            if(con.AccountId!=null && con.FirstName!=null && con.Email!=null){
                for(Contact c: contList){
                    if((con.AccountId==c.AccountId && con.FirstName==c.FirstName && con.Email==c.Email) && con.Id!=c.Id){
                        con.addError('duplicate contact checking individual fields');
                    }
                }
            }        
        }   
    }
}