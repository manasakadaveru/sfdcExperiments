public with sharing class UpdateAddApproveOrRejectCountOnAccHelper{
    public static void updateApprovalOrrejectCount(List<Contact> newConLst, Map<Id, Contact> oldConMap, Map<Id, Contact> newConMap){
        Map<Id, Set<Id>> approvedConsMap = new Map<Id, Set<Id>>();
        Map<Id, Set<Id>> rejectedConsMap = new Map<Id, Set<Id>>();
        Set<Id> accIdsSet = new Set<Id>();
        List<Account> accUpdateLst = new List<Account>();

        for(Contact con: newConLst){
            if(con.RequestedForAddressChangeApproval__c != oldConMap.get(con.Id).RequestedForAddressChangeApproval__c 
            && !con.RequestedForAddressChangeApproval__c
            && con.MailingStreet != oldConMap.get(con.Id).MailingStreet
            && con.MailingStreet == con.RequestedAddress__c){
                accIdsSet.add(con.AccountId);
                if(approvedConsMap.containsKey(con.AccountId)){
                    approvedConsMap.get(con.AccountId).add(con.Id);
                }else{
                    approvedConsMap.put(con.AccountId, new Set<Id>{con.Id});
                }
            }
            else if(con.RequestedForAddressChangeApproval__c != oldConMap.get(con.Id).RequestedForAddressChangeApproval__c 
            && !con.RequestedForAddressChangeApproval__c
            && con.MailingStreet == oldConMap.get(con.Id).MailingStreet
            && con.MailingStreet != con.RequestedAddress__c){
                accIdsSet.add(con.AccountId);
                if(rejectedConsMap.containsKey(con.AccountId)){
                    rejectedConsMap.get(con.AccountId).add(con.Id);
                }else{
                    rejectedConsMap.put(con.AccountId, new Set<Id>{con.Id});
                }
            }
        }
        
        for(Account acc: [SELECT TotalNoOfContactsApprovedForAddressChang__c, TotalNoOfContactsRejectedForAddressChang__c FROM Account WHERE Id IN: accIdsSet]){
            Integer approvedCons = approvedConsMap.containsKey(acc.Id) ? approvedConsMap.get(acc.Id).size() : 0;
            Integer rejectedCons = rejectedConsMap.containsKey(acc.Id) ? rejectedConsMap.get(acc.Id).size() : 0;

            acc.TotalNoOfContactsApprovedForAddressChang__c = acc.TotalNoOfContactsApprovedForAddressChang__c + approvedCons;
            acc.TotalNoOfContactsRejectedForAddressChang__c = acc.TotalNoOfContactsRejectedForAddressChang__c + rejectedCons;

            accUpdateLst.add(acc);
        }

        if(!accUpdateLst.isEmpty()){
            update accUpdateLst;
        }
    }
}