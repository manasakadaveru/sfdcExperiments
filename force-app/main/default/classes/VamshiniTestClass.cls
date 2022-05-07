@isTest
public class VamshiniTestClass {
    static testmethod void UpdateContactProfile()
    {
        Account accObj = new Account();
        accObj.Name ='Testing Account';        
        insert accObj;
        
        accObj.AccountNumber ='6732881';
        accObj.Status__c ='Closed';
        update accObj;
        //accObj
        
        Opportunity op = new Opportunity();        
        op.AccountId = accObj.Id;
        op.Status__c  = 'Open';
        op.StageName = 'Prospecting';
        op.Name = 'ABC';
        op.CloseDate =system.today();
        insert op;
        
        Contact con = new Contact();
        con.AccountId = accObj.Id;
        con.Status__c = 'Open';
        con.LastName ='Reddy';
        insert con;
        con.Status__c ='Closed';
        update con;
        
        Case c = new case();
        c.AccountId = accObj.Id;
        c.Status ='Open';
        insert c;
        c.Status ='Closed';
        update c;
    }      
    
}