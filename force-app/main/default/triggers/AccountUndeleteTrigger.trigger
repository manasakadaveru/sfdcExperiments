trigger AccountUndeleteTrigger on Account (after undelete, after delete) {
    
    /*Account[] theAccount= [select Active__c from Account where id in :trigger.new]; 
    for(Account undeletedAccount : theAccount){ 
        undeletedAccount.Active__c = 'Yes';
    } 
    update theAccount; 
*/    
    if(trigger.isafter && trigger.isdelete) // Using context variable.
    {
     createContactClass.method1(Trigger.old);  // Calling apex class method.
    }
}