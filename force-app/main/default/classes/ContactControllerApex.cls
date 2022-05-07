public with sharing class ContactControllerApex {
    
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactList() {
        return [
            SELECT Id, Name, Title, Phone, Email, Picture__c
            FROM Contact
            WHERE Picture__c != null
            WITH SECURITY_ENFORCED
            LIMIT 10
        ];
    }
    @AuraEnabled(cacheable=true)
    public static Contact getSingleContact(){
        return[
            SELECT Id, Name, Email, Title
            FROM Contact
            WITH SECURITY_ENFORCED
            LIMIT 1
        ];
    }
    @AuraEnabled(cacheable=true)
    public static List<Contact> findContact(String searchKey){
        String key = '%' + searchKey + '%'; 
        return[
            SELECT Id, Name, Email, Title
            FROM Contact
            WHERE Name LIKE :key AND Picture__c != null
            LIMIT 10
        ];     
    }
}