public with sharing class ContactsRelatedToAccounts {
   
    @AuraEnabled(cacheable=true)
    public static List<Contact> getRelatedContactList(Id accId){
        List<Contact> contacts = [SELECT Id, FirstName, LastName,Email from Contact Where AccountId =: accId LIMIT 10];
        return contacts;
    }
}