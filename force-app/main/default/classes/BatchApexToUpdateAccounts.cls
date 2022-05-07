public class BatchApexToUpdateAccounts implements Database.Batchable<sObject>{
    
    public Database.QueryLocator start(Database.BatchableContext bc){
         //Query
        return Database.getQueryLocator('SELECT Id, type from Account Where Name!=null');
    }
    
    public void execute(Database.BatchableContext bc, List<Account> scope){
        List<Account> lstAccount = new List<Account>();
        for(Account acc : scope){
            acc.type = 'Prospect';
            lstAccount.add(acc);
        }
        update lstAccount;
    }
    
    public void finish(Database.BatchableContext bc){
        //Calling another Batch classes..
    }

}