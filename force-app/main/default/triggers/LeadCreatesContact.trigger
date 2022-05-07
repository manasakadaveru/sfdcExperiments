trigger LeadCreatesContact on Lead (before insert) {
    
    List<Lead> leadWithOutConList = new List<Lead>();
    for(Lead ld : trigger.new){
        if(String.isBlank(ld.Contact__c)){
            leadWithOutConList.add(ld);
        }
    }
    if(leadWithOutConList.size()>0){
        List<Contact> newContactsList = new List<Contact>();
        Map<String,Lead> leadNameList = new Map<String,Lead>();
        for(Lead getLead : leadWithOutConList){
            String FirstName = getLead.FirstName;
            String LastName = getLead.LastName;
            String Email = getLead.Email;
            leadNameList.put(FirstName,getLead);
            leadNameList.put(LastName,getLead);
            leadNameList.put(Email,getLead);
            Contact newCont = new Contact(FirstName=FirstName, Email=Email, LastName=LastName);
            newContactsList.add(newCont);
        }
        insert newContactsList;
    }
    
    List<Id> contIDs = new List<Id>();
    Map<Id, Contact> mapOfContact = new Map<Id, Contact>();
    for(Lead newLead : Trigger.new){
        if(newLead.Contact__c != null){
            contIDs.add(newLead.Contact__c);
        }
    }
    List<Contact> conList = [SELECT Id from Contact where Id=: contIDs];
    List<Contact> contsToUpdate = new List<Contact>();
    if(conList.size()>0){
        for(Contact c: conList){
            mapOfContact.put(c.Id, c);
        }
        for(Lead newLead : Trigger.new){
            Contact leadvar = mapOfContact.get(newLead.Contact__c);
            newLead.Contact__c = leadvar.Id;
            contsToUpdate.add(leadvar);
        }
    }
    Update contsToUpdate;
}