public with sharing class ReopenClosedWO {
    @AuraEnabled
    public static String saveWORecord(Id recordId){
        String result;
        System.debug('Wo number='+recordId);
        List<Work_Order__c> woList = [SELECT id, Status__c, Case__r.Status__c
                                     FROM Work_Order__c WHERE Id =: recordId LIMIT 1];
                                     System.debug('Wo number:'+woList[0].Id);                         
        if(!woList.isEmpty() && (woList[0].Status__c == 'Closed' && woList[0].Case__r.Status__c != 'Closed')){
            
            try{
                    integer i =1/0;
                    woList[0].Status__c = 'Open';
                    update woList;
                    result = 'true';
                }catch(Exception e){
                    throw new AuraHandledException(e.getMessage());
                }
        }
        return result;
    }
}