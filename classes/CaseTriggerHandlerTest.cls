@isTest
public class CaseTriggerHandlerTest {
	@isTest
    private static void updateLatestCaseNumberTest(){
        List<Account> accList = new List<Account>();
        List<Case> caseList = new List<Case>();
        
        for(Integer i = 1; i < 5; i++){
            Account acc = new Account();
            acc.Name = 'Test' + i;
     		accList.add(acc);
        }
        
        insert accList;
         
        for(Account acc : accList){
            Case c = new Case();
            c.Status = 'New';
            c.Origin = 'Phone';
            c.AccountId = acc.Id;
            caseList.add(c);
        }
        
        Test.startTest();
            insert caseList; 
        Test.stopTest();
        
        List<Account> UpdatedAcc = [SELECT Id, Latest_Case_Number__c FROM Account WHERE Id =: accList[0].Id];
        List<Case> caseRec = [SELECT Id, CaseNumber FROM Case WHERE Id =: caseList[0].Id];
        System.assertEquals(caseRec[0].CaseNumber, UpdatedAcc[0].Latest_Case_Number__c);
    }
}