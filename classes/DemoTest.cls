@isTest
public class DemoTest {
	@isTest
    private static void testBatchClass(){
        List<Opportunity> oppList = new List<Opportunity>();
        
        for(Integer i = 1; i <= 200; i++){
            oppList.add(new Opportunity(Name = 'Test' + i, StageName = 'Prospecting', CloseDate = Date.today()));
        }
        
        insert oppList;
        
        Test.startTest();
        Demo oppProcess = new Demo();
        Id batchId = Database.executeBatch(oppProcess);
        Test.stopTest();
        
        List<Opportunity> updatedOppList = [SELECT Id FROM Opportunity WHERE LeadSource = 'Web'];
        
        System.assertEquals(200, updatedOppList.size());
    }
}