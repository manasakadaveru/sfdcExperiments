Trigger AccountUpdate on Contact (after update) { 

    Set <String> accID = New Set <String> (); 
    For (Contact con: Trigger.new) { 
        if (con.AccountId != Null ) { 
        accID.add (con.AccountId); 
        } 
    } 
    If (accID.size ()> 0) { 
        List <Account> upAccList = new List <Account> (); 
        For (Account ac:[SELECT Id, BillingCity FROM Account WHERE id in: AccID AND BillingCity = '']) { 
            ac.BillingCity = 'hyd'; 
            UpAccList.add (ac); 
        } 
        If (upAccList.size ()> 0) 
            update upAccList; 
    } 
}