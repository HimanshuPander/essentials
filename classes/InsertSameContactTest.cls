@isTest
public class InsertSameContactTest {
	@isTest
    private static void testQueueableClass(){
        List<Account> accList = new List<Account>();
        List<Id> accIds = new List<Id>();
        
        for(Integer i = 0; i < 5; i++){
            accList.add(new Account(Name = 'Test' + i, Industry = 'Media'));
        }
        
        insert accList;
        
        
        
        Contact con = new Contact(LastName = 'Salesforce Dude');
        insert con;
        
        Test.startTest();
        InsertSameContact queueableProcess = new InsertSameContact(con,'Media');
        Id processId = System.enqueueJob(queueableProcess);
        Test.stopTest();
        
        

        System.assertEquals(5, [SELECT count() FROM Contact WHERE AccountId IN (SELECT Id FROM Account WHERE Industry = 'Media')]);
    }
}