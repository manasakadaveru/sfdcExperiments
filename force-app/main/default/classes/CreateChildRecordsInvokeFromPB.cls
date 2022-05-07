public class CreateChildRecordsInvokeFromPB {
	@InvocableMethod (label='Create Contacts')
    public Static void createContact(List<Id> accIds){ 
    	List<Contact> conListToInsert = new List<Contact>();
        List<Account> accList = [Select Id, Name, Number_of_Contacts__c,Phone from Account where Id =:accIds];
        for(Account acc : accList){
            if(acc.Number_of_Contacts__c != null){
                for(integer i=1;i<=acc.Number_of_Contacts__c;i++){
                    Contact con = new Contact();
                    con.LastName = 'Invocable' + acc.Name +' '+ i;
                    con.MobilePhone = acc.Phone;
                    conListToInsert.add(con);
                }
            }
        }
        if(!conListToInsert.isEmpty()) {
            insert conListToInsert; 
        }
    }
}