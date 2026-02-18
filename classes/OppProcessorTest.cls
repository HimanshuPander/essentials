@isTest
public class OppProcessorTest {
	@isTest
    private static void testBatchClass(){
     
        List<Opportunity> oppList = new List<Opportunity>();
        
        for(Integer i = 0; i < 200; i++){
            oppList.add(new Opportunity(Name = 'Test Opportunity ' + i, StageName = 'Prospecting', CloseDate = System.today()));
        }
        
        insert oppList;
         
        Test.startTest();
        OppProcessor oppProcessor = new OppProcessor();
        Id batchId = Database.executeBatch(oppProcessor);
        Test.stopTest();
        
        List<Opportunity> updateOpps = [SELECT Id FROM Opportunity WHERE LeadSource = 'Web'];
        
        System.assertEquals(200, updateOpps.size());
    }
}