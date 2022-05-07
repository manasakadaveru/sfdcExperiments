trigger OpportunityTriggerDeleteEvent on Opportunity (after delete, after undelete) {
	
    Opportunity[] opptyList = [Select Id from Opportunity Where Id IN:trigger.new ];
    
    for(Opportunity recoveredOpp : opptyList){
        recoveredOpp.Type = 'New Customer';
    }
    update opptyList;
    
	/*List<Account> accList = new List<Account>(); //List<sObject> accList = new List<sObject>(); 
	Set<Id> accntIds = new Set<Id>();
    
    for(Opportunity opp : trigger.old){
        accntIds.add(opp.AccountId);
    } 
    System.debug('accntIds'+accntIds);
    
    Map<Id, Account> accMap = new Map<Id, Account>([Select Id, Name from Account Where Id IN :accntIds]); //Id ='XXXXXXXXXXX' -> Id IN : 
    System.debug('accMap'+accMap);
    for(Opportunity opp : trigger.old){
        if(opp.IsClosed != TRUE){
            Account acc = accMap.get(opp.AccountId);
            acc.Name = acc.Name+' Child Oppty Deleted';
            accList.add(acc);
        }
    }
    update accList;*/
        
}