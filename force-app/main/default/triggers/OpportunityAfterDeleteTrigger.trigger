trigger OpportunityAfterDeleteTrigger on Opportunity (after delete) {
    List<Account> accToUpdate = new List<Account>();
    set<Id> accountId = new Set<Id>();
    for(Opportunity opp : trigger.old) {
        accountId.add(opp.AccountId);
    }
    
    Map<Id,Account> accMap = new Map<Id,Account>([select Id,Active__c from Account where Id In :accountId]);
    
    for(Opportunity opp :trigger.old) {
        if(opp.isClosed!=True){
            Account acc = accMap.get(opp.AccountId);
            acc.Active__c = 'Yes';
            accToUpdate.add(acc);
        }
    }
    
    update accToUpdate;
}