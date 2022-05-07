public class LeadContactClass {
} 
    /*Public static void updateContWithLead(List<Lead> leadList, map<id,Lead> oldMap){
        Set<Id> leadIds = new Set<Id>();
        for(Lead newlead : leadList){
            Lead leadOldMap = oldmap.get(newlead.Contact__c);
            if(newlead.Email != leadOldMap.Email){
                leadIds.add(newlead.Contact__c);
            }
        }
        if(leadIds.size()>0){
            map<Id,Lead> LeadMap=new map<Id,Lead>([SELECT Id, Email, Contact__c from Lead where Contact__c=:leadIds]);
            List<Contact> contList = new List<Contact>();
            for(Lead newLead : leadList){
                Lead leadOldMap = oldmap.get(newlead.Contact__c);
                if(newlead.Email != leadOldMap.Email){
                    if(LeadMap.containsKey(newLead.Contact__c)){
                        Lead newLead1=LeadMap.get(newLead.Contact__c);
                        List<contact>lstCont = newLead1.Contact__c;
                        for(contact c:lstCont){
                            c.Email=LeadMap.Email;
                            contList.add(c);
                        }
                    }
                }
            }
            if(!contList.isEmpty()){
                update contList;
            }
        }
    }*/