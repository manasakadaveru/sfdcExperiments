@isTest
public class DuplicateRecordsOnContactTest {
    
    static testmethod void checkingDupContTest(){
        Account accnt = new Account(Name = 'Test Account');
        insert accnt;
        List<Contact> contactList = new  List<Contact>();
        Set<Id> AccountIds = new Set<Id>();
        Set<String> nameSet = new Set<String>();
        Set<String> emailSet = new Set<String>();
        Test.startTest();
      
        for(Integer i=1 ;i<=200 ; i++){   
            Contact con = new Contact();
            con.AccountId = accnt.Id;
            con.Email = 'test+i@test.com';
            con.FirstName = 'Test contacts';
            con.LastName = 'Sample'+i;
            AccountIds.add(con.AccountId);
        	nameSet.add(con.FirstName);
        	emailSet.add(con.Email);
            contactList.add(con);
        }
        insert contactList; 
        //con.Phone = '7143691740';
        //contactList.add(con);
        //update contactList;
        Test.stopTest();
        contactList = [Select Id, FirstName,Email,AccountId from Contact Where FirstName=:nameSet AND Email=:emailSet AND AccountId=:AccountIds];
        ContactTriggerDemoHandler.checkingDupContacts(contactList);
		
        System.assertEquals(contactList.size() ,200);
    }
}










/* static testmethod void test1(){
List<Contact> conList = new List<Contact>();
Set<Id> accIds = new Set<Id>();
Set<String> nameSet = new Set<String>();
Set<String> emailSet = new Set<String>();

Account acc = new Account();
acc.Name = 'Test1';
acc.Active__c = 'Yes';
acc.SLA__c = 'Gold';
acc.SLAExpirationDate__c = system.today()+5;
acc.SLASerialNumber__c = '098765';
insert acc;

Contact con = new Contact();
con.AccountId = acc.Id;
con.FirstName = 'ConTest1';
con.LastName = 'ConTest1';
con.Email = 'test@gmail.com';
insert con;
//conList.add(con);

Contact con1 = new Contact();
con1.AccountId = acc.Id;
con1.FirstName = 'ConTest1';
con1.LastName = 'ConTest2';
con1.Email = 'test@gmail.com';
con1.Languages__c = 'french';
insert con1;

conList = [Select Id, FirstName,Email,AccountId from Contact where AccountId =:accIds AND 
FirstName =:nameSet AND Email =:emailSet];

test.startTest();
conList.add(con1);
test.stopTest();        

}*/