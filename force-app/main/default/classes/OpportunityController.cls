public with sharing class OpportunityController {

    @AuraEnabled(cacheable=true) // no of DML's would become zero
    //we can't perform any DML operations just we are retreiving data
    public static List<Opportunity> getAllOpportunities(){
        return [SELECT Id, Name, StageName, Amount
                FROM Opportunity];
    }

    @AuraEnabled(cacheable=true) 
    public static List<Opportunity> getOwnOpportunities(){
        return [SELECT Id, Name, StageName, Amount
                FROM Opportunity
                WHERE StageName = 'Closed Won'
                LIMIT 10];
    }

    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOppPopularity(){
        return [SELECT Id,Name, StageName,Amount, CloseDate
                FROM Opportunity
                WHERE StageName='Closed Won' 
                ORDER BY Amount DESC
                LIMIT 10];
        
        
    } 

}