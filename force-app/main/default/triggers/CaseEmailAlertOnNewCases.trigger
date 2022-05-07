trigger CaseEmailAlertOnNewCases on Case (after insert) {
    
    /*for(Case caseObj: trigger.new){    
        
        Case caseList=[Select Id, User__r.Email from Case where Id=:caseObj.Id LIMIT 1];
        if(caseList.User__r.Email != null){
            
            sendEmailApex s=new sendEmailApex();
            s.sendEmail();
            //Messaging.sendEmail(new Messaging.Email[] {message});
        }
    }*/  
}