public with sharing class ContactsAccountsDemo {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getRelatedContactList(Id accntId) {
        
        List<Contact> contacts = [SELECT Id, FirstName, LastName, Title, Phone, Email from Contact 
                                    Where AccountId =: accntId LIMIT 5];
                                
        return contacts;
    }
    @AuraEnabled(cacheable=true)
    public static Account getAddressOfAccount(Id accntId) {
        
        Account address = [SELECT BillingStreet, BillingCity, BillingState,
                            BillingCountry, BillingPostalCode from Account 
                            Where Id =: accntId ];
                                
        return address;
    }
    @AuraEnabled(cacheable=true)
    public static void getDateFieldMethod(date getDate) {
        System.debug('Debug--->'+getDate);
    }
}