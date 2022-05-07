public class ValidationOnStudentInsertion {
    public static void branchMandatoryOnInsertion(List<Student__c> stdParam){
        List<Student__c> stdList = [Select Id, Branch__c from Student__c Where Branch__c =:stdParam[0].Branch__c];
        if(stdList.size()>0){
            for(Student__c std: stdList){
                if(std.Branch__c == Null){
                    std.addError('Student Must have Branch');
                }
            }
        }        
    }
}