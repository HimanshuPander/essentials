public class OpportunityTriggerHandler {
    public static void calTotalAmountAndOpps(List<Opportunity> newList){
        Set<Id> accIds = new Set<Id>();
        List<Opportunity> oppList = new List<Opportunity>();
        List<Account> accList = new List<Account>();
        Map<Id,Account> accIdToAccountMap;
        Map<Id,Decimal> accIdToTotalAmountMap = new Map<Id,Decimal>();
        
        for(Opportunity opp : newList){
            if(opp.AccountId != null){
                accIds.add(opp.AccountId);
                oppList.add(opp);
            }
        }
        
        accIdToAccountMap = new Map<Id,Account>([SELECT Id, Total_Opportunities__c, AnnualRevenue, (SELECT Id FROM Opportunities) FROM Account WHERE Id IN : accIds]);
        
        for(Opportunity opp : [SELECT Id, AccountId, Amount FROM Opportunity WHERE AccountId IN : accIds]){
            Decimal total = 0;
            if(accIdToTotalAmountMap.containsKey(opp.AccountId)){
                total = accIdToTotalAmountMap.get(opp.AccountId);
            }
            if(opp.Amount != null){
                total = total + opp.Amount;
            }
            accIdToTotalAmountMap.put(opp.AccountId, total); 
        }
        
        for(Id accId : accIdToTotalAmountMap.keySet()){
            Account acc = new Account();
            acc.Id = accId;
            acc.Total_Opportunities__c = accIdToAccountMap.get(accId).Opportunities.size();
            acc.AnnualRevenue = accIdToTotalAmountMap.get(accId);
            accList.add(acc);
        }
        
        if(!accList.isEmpty()){
            update accList;
        }
    }
}