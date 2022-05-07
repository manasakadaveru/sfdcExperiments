public class ContactTRGUtils {
	
    public static void setApprover(List<Contact> trgNew, boolean isUpdate, boolean isInsert, boolean isDelete, boolean isAfter){
        if(!isAfter & isUpdate){
            Set<Id> ownerIds= new Set<Id>();
            MAp<Id, User> ownerMap = new Map<Id, User>();
            
            for(Contact cont : trgNew){
                if(cont.In_Approval_Process__c){
                    ownerIds.add(cont.OwnerId);
                }
            }
            for(User u : [Select Id, Special_Approver__c from User Where Id IN: ownerIds]){
                ownerMap.put(u.Id, u);
            }
            List<User> ownersToUpdate = new List<User>();
            
            for(Contact cont : trgNew){
                if(cont.In_Approval_Process__c ){
                    User owner = ownerMap.get(cont.OwnerId);
                    owner.Special_Approver__c = getApprover(cont).Id;
                    ownersToUpdate.add(owner);
                }
            }
            if(!ownersToUpdate.isEmpty()){
                update ownersToUpdate;
            }
        }
    }
    private static User getApprover(Contact cont){
        User approver = [Select Id from User where username = 'manasakadaveru@acc.com'];
        
        if(cont.MailingCity == 'TX'){
            approver = [Select Id from User where username = 'manasakadaveru@acc.com'];
        }
        else{
            approver = [Select Id from User where username = 'manasakadaveru@acc.com'];
        }
        
        return approver;
    }
}