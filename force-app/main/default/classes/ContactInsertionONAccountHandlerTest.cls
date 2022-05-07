@isTest
public class ContactInsertionONAccountHandlerTest {
	

    @testsetup
    static void testSetUpMethod(){
        Test.startTest();
        Account acc =new Account();
        acc.Name = 'Test_Acc';
        insert acc;
        
        Contact cont = new Contact();
        cont.AccountId = acc.Id;
        cont.LastName = 'Test_Cont';
        insert cont;
        Test.stopTest();
    }
	
    @isTest
    static void testMethod1(){
        Test.startTest();
        List<Account> acc = [Select Id, Name From Account where Name = 'Test_Acc'];
        Map<Id, Account> accountMap = new Map<Id, Account>();
        accountMap.put(acc[0].Id, acc[0]);
        ContactInsertionONAccountHandler.createContactUponAccInsertion(accountMap);
        
        Test.stopTest();
    }
}