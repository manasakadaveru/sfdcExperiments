global class ScheduledBatchDeleteInActiveUser implements Schedulable
{
    global void execute(SchedulableContext sc)
    {
        // Implement any logic to be scheduled
       
        // We now call the batch class to be scheduled
        DeleteInActiveUsersBatch b = new DeleteInActiveUsersBatch ();
       
        //Parameters of ExecuteBatch(context,BatchSize)
        database.executebatch(b,3);
    }
   
}