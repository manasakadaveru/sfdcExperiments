trigger UpdateCaseContactOpportunity on Account (after update) {
    
    Map<Id, Account> accountMap = new Map<Id, Account>();
    List<Case> caseList = new List<Case>();
    List<Contact> contactList = new List<Contact>();
    List<Opportunity> opportList = new List<Opportunity>();
    
    for(Account acc : Trigger.New){
        if(acc.Status__c != trigger.oldMap.get(acc.Id).Status__c && acc.Status__c == 'Closed'){
            accountMap.put(acc.Id, acc);
        }
    }
    
    if(accountMap.size()>0){
        
        caseList = [SELECT Id, Status__c,AccountId from Case Where AccountId IN : accountMap.keySet()];
        contactList = [SELECT Id, Status__c, AccountId from Contact Where AccountId IN : accountMap.keySet()];
        if(caseList.size()>0 || contactList.size()>0){
            for(Case cse : caseList){
                cse.Status__c = accountMap.get(cse.AccountId).Status__c;
            }
            for(Contact cont : contactList){
                cont.Status__c = accountMap.get(cont.AccountId).Status__c;
            }
        }
        update caseList;  
        update contactList;
    }
}