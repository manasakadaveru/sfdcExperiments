public class ReOpenWorkOrderController {
    @AuraEnabled
    public static Work_Order__c getWorkOrder(String woId){
        Work_Order__c workOrderId = new Work_Order__c();
        if(woID != null && !String.isBlank(woId)){
            workOrderId = [Select id, Status__c from Work_Order__c where Id =: woID];
        }
        System.debug('Work Order ID is====='+workOrderId);
        return workOrderId;
    }
    
    @AuraEnabled
    public static String saveRecord(Id value){
        string result;
        String msg = '';
        Work_Order__c  wordOrderObj=new Work_Order__c ();
        wordOrderObj = [select id,Name,Status__c,User__c from Work_Order__c where Id =:value];
        if(wordOrderObj!=null){
            
            try{
                wordOrderObj.Status__c = 'Open';
                //wordOrderObj.User__c = UserInfo.getUserName();
                
                Update wordOrderObj;
                result = 'true';
                
            }catch(DmlException e){                
                for (Integer i = 0; i < e.getNumDml(); i++) {
                    system.debug('DmlException Things:::'+e);
                    msg = +e.getDmlMessage(i)+ '\n';
                }
                
                throw new AuraHandledException(msg);
            }catch(Exception e){
                //throw all other exception message
                throw new AuraHandledException(e.getMessage());
            }
            
        }
        return result;
    }    
    
}