public class CustomSettingsExample {
    
    public static void getCSData(){
        List<Example1__c> listCs = Example1__c.getAll().values();
        System.debug('our List-->'+listCs);
        For(Example1__c cs : listCs){
            System.debug('cs-->'+cs);
        }
    }
	
}