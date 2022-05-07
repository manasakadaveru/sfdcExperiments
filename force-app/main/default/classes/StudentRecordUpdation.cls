public class StudentRecordUpdation {
    
   @AuraEnabled
    public static void updateAccount(String accId){
        try{
            Integer i = 1/0;
            Account acc = new Account(Id = accId);
            acc.Description = String.valueOf(System.now());
            update acc;
        }catch(Exception ex){
            throw new AuraException(ex.getMessage());
        }
    }
    
    static string libraryOpened;
    public static void islibraryOpened(List<Library__c> libList){
        
        List<Student_Book_Library__c> stdLibInfo = [Select id, Library__r.Is_Library_Opened__c, Student__r.Is_Library_Available__c 
                                                 from Student_Book_Library__c
                                                 Where Library__c IN : libList];
        List<Student__c> stdinfo = [Select id, Is_Library_Available__c from Student__c ];
        for(Student_Book_Library__c sbl: stdLibInfo){
            if(sbl.Library__r.Is_Library_Opened__c != null){
                libraryOpened = sbl.Library__r.Is_Library_Opened__c;                
            }
            sbl.Student__r.Is_Library_Available__c = libraryOpened;
        }
        /*List<Library__c> libInfo = [Select id from Library__c];
        for(Library__c lib : libInfo){
            if(lib.Is_Library_Opened__c != null){
                libraryOpened = lib.Is_Library_Opened__c;
            }
            stdLibInfo.Student__r.Is_Library_Available__c = libraryOpened;
        }*/
    }
       
}