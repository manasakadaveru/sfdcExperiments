public class Pavan_PickList_PopUpFieldWindow {
    
    @AuraEnabled
    public static boolean getCaseDetails(String caseId, String description){
        String caseStatus = '';
        String msg = '';
        boolean isClosed;
        Case caseObj = new Case();
        caseObj = [SELECT Id, Status__c, Description from Case Where Id =: caseId LIMIT 1];
        caseStatus = caseObj.Status__c;
        if(caseObj != NULL){
            try{	
                isClosed = caseStatus == 'Closed' ? true : false;
                caseObj.Description = description;
            	update caseObj;
            }catch(DmlException e){
                for (Integer i = 0; i < e.getNumDml(); i++) {
                    System.debug('the error  is '+e.getDmlMessage(i));
                    msg =+ e.getDmlMessage(i) +  '\n' ;
                }
                throw new AuraHandledException(msg);                
            }catch(Exception e){
                throw new AuraHandledException(e.getMessage());
            }
        }        
        return isClosed;
    }

}