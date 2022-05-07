public with sharing class StudentController {

    @AuraEnabled(cacheable=true)
    public static List<Contact> getAllContacts(){
        return [SELECT Id, FirstName, LastName, Email, Phone, Title
                FROM Contact];
    }

     @AuraEnabled(cacheable=true)
    public static List<Contact> getAllLocations(){
        return [SELECT MailingStreet, MailingCity, MailingCountry
                FROM Contact];
    }

    @AuraEnabled(cacheable=true)
    public static List<Case> getCaseRecords(){
        return [SELECT CaseNumber, Status, ClosedDate, Origin, Priority
                from Case ];
    }

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountRecords(){
        return [SELECT Id, Name
                from Account ];
    }

}