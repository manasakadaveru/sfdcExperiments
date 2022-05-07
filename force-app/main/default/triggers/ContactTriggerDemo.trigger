trigger ContactTriggerDemo on Contact (before insert, before update) {
    
    /*for(Contact con: trigger.new){
        con.UniqueID__c = con.AccountId+con.FirstName+con.Email;
    }*/
    
    if(Trigger.isInsert && Trigger.isBefore) {    
        ContactTriggerDemoHandler.checkingDupContacts(trigger.new);
    }
  
    if(Trigger.isUpdate && Trigger.isBefore) {           
        ContactTriggerDemoHandler.checkingDupContacts(trigger.new);
    }
    
    
}