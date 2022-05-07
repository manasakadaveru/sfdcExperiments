trigger UpdateAccountOnContactChnages on Contact (after insert, after update) {

    /*Map<ID, Account> parentOpps = new Map<ID, Account>(); //Making it a map instead of list for easier lookup
    List<Id> listIds = new List<Id>();
    
    for (contact childObj : Trigger.new) {
        listIds.add(childObj.AccountId);
    }
    
    parentOpps = new Map<Id, account>([SELECT id, MEG_Account__c FROM Account WHERE ID IN :listIds]);
    
    List<Account> updatedParentOpps = new List<Account>();
    
    for (contact con: Trigger.new){
        if(parentOpps.containsKey(con.AccountId)) { 
            Account myAccount = parentOpps.get(con.MEG_Account__c);                                                
            //if(myAccount !=null){
                myAccount.MEG_Account__c = con.AccountId;
                updatedParentOpps.add(myAccount);
            //}
        }
    }
    System.debug('size-->'+updatedParentOpps);
    if(updatedParentOpps.size()>0){
        update updatedParentOpps;
        System.debug('------>Updated?'+updatedParentOpps);
    }*/
    
    Map<Id, Account> parentAccount = new Map<Id, Account>();
    Map<Id, Account> parentAccount1 = new Map<Id, Account>();
    List<Id> listIds = new List<Id>();
    List<Id> FlaseListIds = new List<Id>();
    List<Id> ContIds = new List<Id>();

    for(Contact contChild : Trigger.New){
        if(contChild.In_Approval_Process__c == TRUE){
            listIds.add(contChild.AccountId);
        }
        else if(contChild.In_Approval_Process__c == False){
            FlaseListIds.add(contChild.AccountId);
        }
    }
    System.debug('listIds-->'+listIds+'---->false->'+FlaseListIds);
    
    parentAccount = new Map<Id, Account>([SELECT Id, Name, Status__c,MEG_Account__c from Account
                                       Where Id IN: listIds AND RecordType.Name = 'Test']);
    parentAccount1 = new Map<Id, Account>([SELECT Id, Name, Status__c,MEG_Account__c from Account
                                       Where Id IN: FlaseListIds AND RecordType.Name = 'Test']);
    
    System.debug('parentAccount-->'+parentAccount);
    
    List<Account> accList = new List<Account>();
    for(Contact cont : Trigger.New){
        Account acct = parentAccount.get(cont.AccountId);
        Account acct1 = parentAccount1.get(cont.AccountId);
        if(cont.In_Approval_Process__c == TRUE){
            acct.MEG_Account__c = cont.MEG_Account__c;
            accList.add(acct);
        } 
        else if(cont.In_Approval_Process__c == FALSE){
            acct1.MEG_Account__c = null;
            accList.add(acct1);
        }
    }
    if(accList.size()>0){
        update accList;
    }
    
}