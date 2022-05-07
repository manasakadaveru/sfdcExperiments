public class sendEmailApex {
    public void SendEmail()  {
        String subject = 'New Case Created';
        String body = 'Ne istam vachindhi rasuko';
        
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        email.setSubject( subject );
        
        email.setToAddresses( new String[] {UserInfo.getUserEmail()} );  
        email.setPlainTextBody( body );  
        
        Messaging.SendEmailResult [] r = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});        
    }
}