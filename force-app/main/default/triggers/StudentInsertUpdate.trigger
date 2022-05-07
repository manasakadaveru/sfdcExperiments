trigger StudentInsertUpdate on Student__c (before insert) {
    
    if(Trigger.IsInsert && Trigger.IsBefore){
        ValidationOnStudentInsertion.branchMandatoryOnInsertion(Trigger.New);
    }

	

    /*List<Student__c> stdList = [Select Id, Branch__c from Student__c Where Branch__c =:Trigger.New[0].Branch__c];
    if(stdList.size()>0){
        if(stdList[0].Branch__c == null){
            Trigger.New[0].addError('Student Must have Branch value'); 
        }
    }   */
		    
}