@isTest
public class DailyOppProcessorTest {
	@isTest
    private static void testScheduledApex(){
        List<Opportunity> oppList = new List<Opportunity>();
        String sch = '0 0 0 ? * * *';
        
        for(Integer i = 0; i < 500; i++){
            if(i < 250){
                oppList.add(new Opportunity(name = 'Test' + i, stageName = 'Prospecting', closeDate = System.today()));
            }else{
                oppList.add(new Opportunity(name = 'Test Opportunity' + i, stagename = 'Qualification', closeDate = System.today(),LeadSource= 'Other'));
            }
        }
        
        insert oppList;
        
        Test.startTest();
        String jobId = System.schedule('Daily Opp Processor', sch, new DailyOppProcessor());
        Test.stopTest();
        
        List<Opportunity> updatedOpps = [SELECT Id, LeadSource FROM Opportunity WHERE LeadSource = 'Web'];
        System.assertEquals(200, updatedOpps.size());
    }
}