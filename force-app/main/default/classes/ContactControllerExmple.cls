public with sharing class ContactControllerExmple {
    
    @AuraEnabled(cacheable=true)
    
    public static List<Contact> getContactLists(){
        return [Select Id, Name, Phone, Email from Contact LIMIT 10];
    }

}