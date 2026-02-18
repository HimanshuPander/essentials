@isTest
public class OpportunityTriggerHandlerTest {
	@isTest
    private static void calTotalAmountAndOppsTest(){
        List<Account> accList = new List<Account>();
        List<Opportunity> oppList = new List<Opportunity>();
        
        for(Integer i = 1; i <= 5; i++){ 
            Account acc = new Account();
            acc.Name = 'Test ' + i;
            accList.add(acc);
        }
        
        insert accList;
        
        for(Account acc : accList){
            for(Integer i = 1; i <= 2; i++){
            	Opportunity opp = new Opportunity();
                opp.Name = acc.Name;
                opp.StageName = 'Prospecting';
                opp.CloseDate = Date.today();
                opp.Amount = 2000;
                opp.AccountId = acc.Id;
                oppList.add(opp);   
            }
        }
        
        Test.startTest();
        insert oppList;
        Test.stopTest();
        
        List<Account> accListUpdated = [SELECT Id, Total_Opportunities__c, AnnualRevenue FROM Account WHERE Id =: accList[0].Id];
        System.assertEquals(4000, accListUpdated[0].AnnualRevenue);
        System.assertEquals(2, accListUpdated[0].Total_Opportunities__c);   
    }
}