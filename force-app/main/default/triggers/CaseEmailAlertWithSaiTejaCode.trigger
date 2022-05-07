trigger CaseEmailAlertWithSaiTejaCode on Case (after insert, after update) {
    
    /*for(Case caseObj: trigger.new){
        List<Case> newCase = new List<Case>();
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        
        newCase = [Select Id,User__r.Email from Case where Id=:caseObj.Id LIMIT 1];
        String[] toAddresses = new String[] {newCase[0].User__r.Email};
       	System.debug('toAddresses'+toAddresses);
        if(!newCase.isEmpty() && toAddresses!=null){            
            EmailTemplate tpl = (EmailTemplate)[select Id, Subject, Body FROM EmailTemplate WHERE Name = 'Case Creation Notification' limit 1];
            
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setToAddresses(toAddresses);
            mail.setSubject(tpl.Subject);
            mail.setPlainTextBody(tpl.Body);
            mails.add(mail);
            
            //List<Messaging.SendEmailResult> results = Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
            Messaging.sendEmailResult[] results= Messaging.sendEmail(mails);
            
            if (results[0].success) {
                System.debug('Suceesss');
            }else {
                System.debug('OOPS! MAIL NOT SENT');
            }
        }
    }*/
    
}