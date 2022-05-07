trigger VamshiniTaskOnPearson on Account (before update) {
    
    Map<Id, Account> mapAccountIdAccount = new Map<Id, Account>();                                                                  //[Select Id,Status__c FROM Account WHERE Id IN : Trigger.new]);//
    List<Contact> lstContactsToUpdate = new List<Contact>();
    List<Case> lstCaseToUpdate = new List<Case>();
    List<Opportunity> lstOppToUpdate = new List<Opportunity>();
    
    List<id> acclist = new List<id>();
    if(Trigger.isInsert || Trigger.isUpdate && Trigger.isAfter){
        
        for(Account acc : Trigger.new){
            
            if(acc.Status__c != Null && acc.Status__c == 'Closed'){
                acclist.add(acc.id);
            }
            
            List<Contact> lstContact = new List<Contact>([SELECT Id,Name,AccountId,Status__c FROM Contact WHERE AccountId IN : acclist]);
            
            for(Contact con : lstContact ){
                
                if(con.status__c != 'Closed'){
                    
                    con.status__c ='Closed';
                    lstContactsToUpdate.add(con);
                }
                
            }
            List<Case> lstcase = new List<Case>([SELECT Id,AccountId,Status FROM Case WHERE AccountId IN : acclist]);  
            for(Case c : lstCase ){
                
                if(c.Status != 'Closed'){
                    
                    c.Status ='Closed';
                    lstCaseToUpdate.add(c);
                }
                
            }
            List<Opportunity> lstopp = new List<Opportunity>([SELECT Id,AccountId,Status__c FROM Opportunity WHERE AccountId IN : acclist]);  
            for(Opportunity opp : lstopp ){
                
                if(opp.Status__c != 'Closed'){
                    
                    opp.Status__c ='Closed';
                    lstOppToUpdate.add(opp);
                }
                
            }
            
        }
        if(lstContactsToUpdate.size()>0)
            update lstContactsToUpdate;
        if(lstCaseToUpdate.size()>0)
            update lstCaseToUpdate;
        if(lstOppToUpdate.size()>0)
            update lstOppToUpdate;
        
    }
}