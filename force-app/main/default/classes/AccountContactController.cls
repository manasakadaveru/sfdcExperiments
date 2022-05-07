public class AccountContactController{
     
    @AuraEnabled(cacheable=true)
    public static List<AccountContactListWrapper> getAllAccountWithContacts(){
        
         /* 
        ID workspaceId = [SELECT Id FROM ContentWorkspace WHERE Name = '123'][0].Id;
System.debug('LibraryId--->'+workspaceId);
List <ContentVersion> allDocuments = [SELECT Title FROM ContentVersion WHERE ContentDocument.ParentId =: workspaceId];
System.debug('--FilesInLibraries--'+allDocuments);
List<ContentFolderItem> FilesInFolders = [SELECT Id, Title, FileExtension, ParentContentFolderId FROM ContentFolderItem WHERE ParentContentFolderId IN (SELECT Id FROM ContentFolder WHERE ParentContentFolder.Name =: workspaceId)];
System.debug('FilesInFolders-->'+FilesInFolders);
       */
        List<AccountContactListWrapper> accWrapperList = new List<AccountContactListWrapper>();
        List<Account> accList = [SELECT Id, Name, BillingState, Website, Phone,
                                    (SELECT Id, FirstName, LastName, Name, Email From Contacts)
                                    FROM Account LIMIT 5];
        if(!accList.isEmpty()){
            for(Account acc : accList){
                AccountContactListWrapper accWrapper = new AccountContactListWrapper();
                accWrapper.accRecord = acc;
                accWrapper.contactList = acc.Contacts;
                accWrapper.contactCount = acc.Contacts.size();
                accWrapperList.add(accWrapper);
            }
        }
        return accWrapperList;
    }

    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactsRelatedToAccounts(Id accoundId){
        List<Contact> contList = [Select Id, Name, AccountId from Contact where AccountId = :accoundId ];
        if(!contList.isEmpty()){
            System.debug('ContacTList+++'+contList);
        }
        return contList;
    }
     
    // wrapper class with @AuraEnabled and {get;set;} properties 
    public class AccountContactListWrapper{
        @AuraEnabled
        public Account accRecord{get;set;}
        @AuraEnabled
        public List<Contact> contactList{get;set;}
        @AuraEnabled
        public Integer contactCount{get;set;}
    }


    
}