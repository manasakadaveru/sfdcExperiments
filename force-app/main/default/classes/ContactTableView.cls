public with sharing class ContactTableView {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getAccountList() {
        return [Select Id, AccountId from Contact where Id= '0032v00003UNmkPAAT'];
    }
}