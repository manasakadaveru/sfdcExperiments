public with sharing class ContactDemo {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactList(Id accntId) {
        
        List<Contact> contacts = [SELECT Id, FirstName, LastName, Title, Phone, Email from Contact 
        Where AccountId =: accntId LIMIT 10];
        return contacts;
    }

    @AuraEnabled(cacheable=true)
    public static List<Work_Order__c> getWorkOrderList() {
        
        List<Work_Order__c> contacts = [SELECT Id,Name, Status__c from Work_Order__c 
                                        LIMIT 10];
        return contacts;
    }
}