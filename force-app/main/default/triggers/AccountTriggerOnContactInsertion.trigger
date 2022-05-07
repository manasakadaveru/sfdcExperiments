trigger AccountTriggerOnContactInsertion on Account (after insert, after update) {
    if(Trigger.isAfter){
        if(Trigger.isInsert){
            //Code Logic 
            //Apex classes called as handlers
            //Apex classes will handle the logic
            ContactInsertionONAccountHandler.createContactUponAccInsertion(Trigger.newMap);
        }
    }
    /*if(trigger.isAfter && trigger.isUpdate){
        ContactInsertionONAccountHandler.updateContactNameOnAccNameUpdation(trigger.New, trigger.oldMap);
    }*/
}