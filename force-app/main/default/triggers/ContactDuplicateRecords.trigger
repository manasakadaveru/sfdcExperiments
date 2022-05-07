trigger ContactDuplicateRecords on Contact (before insert, before update) {
    
    /*Map<Id,Contact> existingContMap = new Map<Id,Contact>([SELECT Id, AccountId, FirstName, Email FROM Contact]);
    
        if(!(existingContMap.isEmpty())){
            for(Contact con : Trigger.New){
                if(con.AccountId == existingContMap.get(con.Id).AccountId && 
                   con.FirstName == existingContMap.get(con.Id).FirstName &&
                   con.Email == existingContMap.get(con.Id).Email){
                       con.addError('You can not create duplicate Contact');
                   }
            }
        }*/
  
    /*List<Contact> ContList=new List<Contact>([select Id,Email,FirstName,AccountId from Contact]);
    map<String,Contact> contMap=new map<String,Contact>();
    for(Contact con:ContList){
        contMap.put(con.Email,con);
        contMap.put(con.FirstName,con);
        contMap.put(con.AccountId,con);
    }
 
        for(Contact con:Trigger.new){
            if(contMap.get(con.Email)!=null && contMap.get(con.FirstName)!=null && contMap.get(con.AccountId)!=null){
                con.adderror('You are trying to create duplicate Contact');
            }
        }*/
    
    List<Contact> ContList=new List<Contact>([select Id,FirstName, Email, AccountId from Contact]);
    map<String,Contact> contMap=new map<String,Contact>();
    for(Contact con:ContList){
        contMap.put(con.Email,con);
        contMap.put(con.FirstName,con);
        contMap.put(con.AccountId,con);
    }
    //For Insert Operation
    if(Trigger.isinsert&&Trigger.isbefore){
        for(Contact con:Trigger.new){
            if(contMap.get(con.Email)!=null && contMap.get(con.FirstName)!=null && contMap.get(con.AccountId)!=null){
                con.adderror('You are trying to create duplicate Contact');
            }
        }
    }
    //For Update Operation
    if(Trigger.isupdate&&Trigger.isbefore){
        for(Contact cont:Trigger.new){
            if(((Trigger.oldmap.get(cont.id).Email == cont.Email)&&(contMap.get(cont.Email)!=null)) ||
               ((Trigger.oldmap.get(cont.id).FirstName == cont.FirstName)&&(contMap.get(cont.FirstName)!=null)) ||
               ((Trigger.oldmap.get(cont.id).AccountId == cont.AccountId)&&(contMap.get(cont.AccountId)!=null))){
                cont.adderror('You are trying to update Contact by giving duplicate values');
            }
        }
    }
    
    
    
}