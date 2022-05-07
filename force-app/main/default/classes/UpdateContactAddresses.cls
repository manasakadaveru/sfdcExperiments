global class UpdateContactAddresses implements 
    Database.Batchable<sObject>, Database.Stateful {
        global List<String> errorMessages = new List<String>();
    
    global Integer recordsProcessed = 0;
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT ID, BillingStreet, BillingCity, BillingState, ' +
            'BillingPostalCode, BillingCountry, OwnerId, (SELECT ID, MailingStreet, MailingCity, ' +
            'MailingState, MailingPostalCode, MailingCountry, OwnerId FROM Contacts) FROM Account ' + 
            'Where BillingCountry = \'TGG\''
        );
    }
    global void execute(Database.BatchableContext bc, List<Account> scope){
       
        List<Contact> contacts = new List<Contact>();
        for (Account account : scope) {
            for (Contact contact : account.contacts) {
                contact.MailingStreet = account.BillingStreet;
                contact.MailingCity = account.BillingCity;
                contact.MailingState = account.BillingState;
                contact.MailingPostalCode = account.BillingPostalCode;
                contact.MailingCountry = Account.BillingCountry;
                contacts.add(contact);
               
                recordsProcessed = recordsProcessed + 1;
            }
        }
        update contacts;
    }    
    global void finish(Database.BatchableContext bc){
        List<Messaging.SingleEmailMessage> emailList=new List<Messaging.SingleEmailMessage>();
        System.debug(recordsProcessed + ' records processed!');
        AsyncApexJob job = [SELECT Id, Status, CreatedBy.Email
            				FROM AsyncApexJob WHERE Id = :bc.getJobId()];
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        //String[] toAddresses = new String[] {job.CreatedBy.Email};
        String[] toAddresses = new String[] {'manasa.kadaveru@accenture.com'};
        mail.setToAddresses(toAddresses);
        mail.setSubject('JOB Salesforce RenewalEmailNotification Finished: ' + job.Status);
        String bodyText=' Number of records processed ' +recordsProcessed;
        mail.setPlainTextBody(bodyText);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        system.debug('Mail LIMIT=='+mail.toaddresses);
        //myDMLLimit = Limits.getDMLStatements();
    }    
}