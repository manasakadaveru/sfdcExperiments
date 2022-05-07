public class SchedulableBatchApexClass implements Schedulable {
    
    public void execute(SchedulableContext contxt){
        BatchApexToUpdateAccounts batch = new BatchApexToUpdateAccounts();
		Database.executeBatch(batch);
    }
}