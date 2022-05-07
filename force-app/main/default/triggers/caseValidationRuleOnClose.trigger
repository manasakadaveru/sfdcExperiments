trigger caseValidationRuleOnClose on Case (before update) {
	Map<String,Case> mapCaseToId = new Map<String,Case>();
    for(Case cse : Trigger.New){
        if(cse.Status__c == 'Closed'){
            mapCaseToId.put(cse.Id, cse);
        }
    }
    List<Work_Order__c> woList = [Select Id,Case__c from Work_Order__c where Case__r.Id IN: mapCaseToId.keySet() and Case__r.Status__c != 'Closed'];
    for(Work_Order__c wos : woList){
        Case parentCase = mapCaseToId.get(wos.Case__c);
        parentCase.addError('Can not close Case');
    }
}
/*
Map<String,Case> mapCase = new Map<String,Case>();
for(Case c : Trigger.New){
    if(c.Status == 'Closed'){
    	mapCase.put(c.Id,c);
    }
}
List<WorkOrder> woList = [Select Id,Case__c from WorkOrder where Case__r.Id IN :mapCase.KeySet() and Case__r.Status !='Closed'];
for(WorkOrder wos : woList){
	Case parentCase = mapCase.get(wos.Case__c);
	Case__c.adderror
}
*/