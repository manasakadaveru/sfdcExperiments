trigger ContactCreatesBasedOnLeadCreation on Contact (before insert) {
    Map<Id, List<Lead>> mapContactToCM = new Map<Id, List<Lead>>();
    List<Lead> lstCM;
    for(Lead cm : [SELECT Id, Contact__c FROM   Lead WHERE  Contact__c IN :trigger.newMap.keySet()]){
        if(!mapContactToCM.containsKey(cm.Contact__c)){
            mapContactToCM.put(cm.Contact__c,new List<Lead> { cm });
        }
        else{
            lstCM = mapContactToCM.get(cm.Contact__c);
            lstCM.add(cm);
            mapContactToCM.put(cm.Contact__c, lstCM);
        }
    }
    
    List<Lead> lstCMToUpdate = new List<Lead>();
    for(Contact con : trigger.new)
        if(mapContactToCM.containsKey(con.Id)){
            lstCM = mapContactToCM.get(con.Id);
            for(Lead cm : lstCM)
                if(cm.Contact__c != con.Id)
                    lstCMToUpdate.add(new Lead(Contact__c = con.Id, Id = cm.Id));
        }
        
    if(!lstCMToUpdate.isEmpty()){
        UPDATE lstCMToUpdate;
    }
}