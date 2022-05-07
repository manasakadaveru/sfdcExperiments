@isTest
public class DeleteInActiveUsersBatchTest {
    public static testmethod void DeleteInActiveUsersBatchTestMethod() {
        Test.startTest();
            DeleteInActiveUsersBatch b = new DeleteInActiveUsersBatch();
            DataBase.executeBatch(b,3);
        Test.stopTest();
    }
}