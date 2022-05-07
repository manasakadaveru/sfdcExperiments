public class createContactClass {
	
    public static void method1(List<Account> accList){ // Getting list of account records.
        List<BoatType__c> assList =new List<BoatType__c>();
        for(Account acc:accList){ // Iterating over account list.
            for(BoatType__c cs:[Select id from BoatType__c where Boat__c=:acc.id]){
                assList.add(cs); // Adding related child object associated to an account in a list.
            }
        }
        if(assList.size() > 0){ // Checking if the list contains records.
            delete assList; // Deleting records.
        }
      
    }
}