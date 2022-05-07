trigger Vamshu_AccountZipCodeTrigger on Account (After update) {
    for (Account acc : Trigger.new)
    {  
        //Check whether Old and New BillingPostalCode are different
        if(Trigger.oldmap.get(acc.id).BillingPostalCode  !=  Trigger.newmap.get(acc.id).BillingPostalCode )
        {
            //Get the New Owner Id and zipcode and used in below SOQL
            //Id newuserId = Trigger.newmap.get(acc.id).OwnerId; 
            String accountZipCode = Trigger.newmap.get(acc.id).BillingPostalCode;
            
            system.debug('OldOwnerId'+ Trigger.oldmap.get(acc.id).OwnerId + 'NewOwnerId'+ Trigger.newmap.get(acc.id).OwnerId); 
            system.debug('OldZip'+ Trigger.oldmap.get(acc.id).BillingPostalCode + 'newZip'+ Trigger.newmap.get(acc.id).BillingPostalCode); 
            
            List<Account> NewAccountlisttoUpdate = new List<Account>();
            List<Template__c> getTemplateZipCode =[Select Id,OwnerId,Zip_Code__c from Template__c Where Zip_Code__c= : accountZipCode];
            String TemplateZipCode = getTemplateZipCode[0].Zip_Code__c;
            
            List<Account> AccountstoUpdateOwner=[Select Id,OwnerId,BillingPostalCode from Account where BillingPostalCode = :getTemplateZipCode[0].Zip_Code__c LIMIT 1];
            //Set<Id> set_accountId = new Set<Id>();//used to store the Updated Account Ids and used in Contact Search SOQL
            for (Account a1 : AccountstoUpdateOwner )
            {
                if (a1.BillingPostalCode == TemplateZipCode)
                {
                    a1.OwnerId=getTemplateZipCode[0].OwnerId;
                    NewAccountlisttoUpdate.add(a1);                    
                }
            }
            update NewAccountlisttoUpdate;
        }
    }
}