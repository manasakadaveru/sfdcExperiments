trigger AccountTriggerExample_Sri on Account (before delete, before update, before insert) {
if (Trigger.isBefore) {
    if (Trigger.isDelete) {    
        for(Account acc : trigger.old){
            if(acc.Rating == 'Cold'){
                acc.addError('you can not delete');
            }
        }
    }
    else{
        for(Account a : trigger.new){
            a.description = 'New Trigger EVENTS';
            a.Name = 'DEFAULT NAME';
            if(a.Rating == 'Hot'){
                a.addError('IT is too hot');
                //a.description = 'Updated to HOT';
            }
            if(a.Rating == 'Cold'){
                a.description = 'Updated to Cold';
            }
            if(a.Rating == 'Warm'){
                a.description = 'Updated to Warm';
            }
        }
        
    }
}
        
    
}