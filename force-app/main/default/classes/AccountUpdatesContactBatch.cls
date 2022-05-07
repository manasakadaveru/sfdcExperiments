global class AccountUpdatesContactBatch implements Database.Batchable<sObject>, Database.Stateful{
    
    List<Account> parentAccList = new List<Account>();
    List<Contact> contList = new List<Contact>();
    
    global AccountUpdatesContactBatch(List<account> accountToUpdate){
        parentAccList = accountToUpdate;
    }
    
    global Database.QueryLocator start(Database.BatchableContext BC){
        return database.getQueryLocator([SELECT Id, AccountId from Contact WHERE AccountId =: parentAccList]);
    }
    global void execute(Database.BatchableContext BC, List<Contact> contList1){
        for(Account acc: parentAccList){
            for(Contact con: contList1){
                if(con.AccountId==acc.Id){
                    contList.add(new Contact(Id=con.Id));
                }
            }
        }
        update contList;
    }
    global void finish(Database.BatchableContext BC){
        
    }
}