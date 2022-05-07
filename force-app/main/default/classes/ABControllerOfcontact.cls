public with sharing class ABControllerOfcontact {
    @AuraEnabled
    public static Contact getSingleContact(){
        return [SELECT Id, Name from Contact];
    }
}