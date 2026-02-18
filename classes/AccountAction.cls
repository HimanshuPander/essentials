public class AccountAction {
	@InvocableMethod
    public static List<Decimal> updateAccRevenue(List<Id> ids){
        List<Opportunity> oppList = [Select AccountId,Amount from Opportunity Where Id =: ids[0]];
        List<Account> accList  = [Select AnnualRevenue from Account where Id =: oppList[0].accountId];
        
        List<Decimal> annualRevenueList = new List<Decimal>();
        
        accList[0].AnnualRevenue = accList[0].AnnualRevenue + oppList[0].Amount;
        
        update accList;
        
        annualRevenueList.add(accList[0].AnnualRevenue);
    return annualRevenueList;
    }
}