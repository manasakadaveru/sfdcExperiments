global class UpdateAccountBillingState implements Database.Batchable<sObject>, Database.Stateful{
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT ID,BillingState,BillingCountry FROM Account Where BillingCountry =\'USA\' OR BillingState =\'\''
        );
    }
    global void execute(Database.BatchableContext bc, List<Account> scope){
        // process each batch of record
        List<Account> lstAccount = new List<Account>();
            for (Account acc : scope) {
                acc.BillingState = 'California';
                lstAccount.add(acc);
            }
        update lstAccount;
    }
    global void finish(Database.BatchableContext bc){
        
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        
        // Use the
        AsyncApexJob a = [Select a.TotalJobItems, a.Status, a.NumberOfErrors,
                          a.JobType, a.JobItemsProcessed, a.ExtendedStatus, a.CreatedById,
                          a.CompletedDate From AsyncApexJob a WHERE id = :BC.getJobId()];
        
        // below code will send an email to User about the status
        String[] email = new String[]{'manasakdvr97@gmail.com'};
            mail.setToAddresses(email);
        mail.setReplyTo('manasakdvr97@gmail.com'); // Add here your email address
        mail.setSenderDisplayName('Apex Batch Processing Module');
        mail.setSubject('Batch Processing '+a.Status);
        mail.setPlainTextBody('The Batch Apex job processed '+ a.TotalJobItems+'batches with '+a.NumberOfErrors+
                              'failures '+'Job Itemprocessed are '+a.JobItemsProcessed);
        Messaging.sendEmail(new Messaging.Singleemailmessage [] {mail});
        
        System.debug('Completed Batch Execution');
    }    
    
}