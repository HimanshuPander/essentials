public class Demo implements Database.Batchable<sObject>, Database.stateful{
   Public Integer recordCount = 0;
    
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([SELECT Id, LeadSource FROM Opportunity]);
    }
    
    public void execute(Database.BatchableContext bc, List<Opportunity> oppList){
        for(Opportunity opp : oppList){
            opp.LeadSource = 'Web';
        }
        update oppList;
        
        recordCount = recordCount + oppList.size();
    }
    
    public void finish(Database.BatchableContext bc){
        System.debug('Total Records Processed : ' + recordCount);
    }
}