trigger DuplicateRecordsOnContact on Contact (before insert, before update) {
   
    Set<Id> AccountIds = new Set<Id>();
    List<Contact> contList = new  List<Contact>();
    
    for(Contact con: trigger.new){
        if(con.AccountId!=null){
            AccountIds.add(con.AccountId); 
        }        
    }
    
    for(Contact con: [Select Id, FirstName,Email,AccountId from Contact where AccountId =:AccountIds]){
        contList.add(con);
    }
    for(Contact con: trigger.new){
        if(con.AccountId != NULL){
            for(Contact c: contList){
                if(con.AccountId==c.AccountId && con.FirstName==c.FirstName && con.Email==c.Email && con.Id!=c.Id){
                    con.addError('duplicate contact checking among 3 fields');
                }
            }
        }        
    }
       
}