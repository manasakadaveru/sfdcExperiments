global class DeleteInActiveUsersBatch implements Database.Batchable<sObject>{

    global Database.QueryLocator start(Database.BatchableContext BC){
        Map<Id ,User> users =new Map<Id ,User>([Select id from User where IsActive= false]);
        //string query = 'Select id from User where IsActive= false'
        return Database.getQueryLocator([Select Id from Case where OwnerId IN :users.keyset()]);
    }
    global void execute(Database.BatchableContext BC, List<sObject> scope){
        delete scope ;
    }
    global void finish(Database.BatchableContext BC){
    }

}