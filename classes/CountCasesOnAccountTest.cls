@isTest
public class CountCasesOnAccountTest {
	@isTest
    public static void testCountCases(){
        List<Account> accList = new List<Account>();
        List<Id> accIds = new List<Id>();
        
        for(Integer i = 1; i <= 5; i++){
            Account acc = new Account(Name = 'Test'+i);
            accList.add(acc);
        }
        
        insert accList;
        
        List<Case> caseList = new List<Case>();
        
        for(Account acc : accList){
            accIds.add(acc.Id);
            for(Integer i = 0; i < 3; i++){
                Case c = new Case();
                c.Status = 'New';
                c.Origin = 'Phone';
                c.AccountId = acc.Id;
                caseList.add(c);
            }  
            for(Integer i = 0; i < 3; i++){
                Case c = new Case();
                c.Status = 'New';
                c.Origin = 'Web';
                c.AccountId = acc.Id;
                caseList.add(c);
            }  
            for(Integer i = 0; i < 3; i++){
                Case c = new Case();
                c.Status = 'New';
                c.Origin = 'Email';
                c.AccountId = acc.Id;
                caseList.add(c);
            }  
        }
        insert caseList;
        
        Test.startTest();
        	CountCasesOnAccount.countCases(accIds);
        Test.stopTest();
        
        List<Account> updatedAcc = [SELECT Id, Total_Phone_Cases__c, Total_Web_Cases__c, Total_Email_Cases__c FROM Account WHERE Id IN:accIds];
        
        System.assertEquals(3, updatedAcc[0].Total_Phone_Cases__c);
        System.assertEquals(3, updatedAcc[0].Total_Web_Cases__c);
        System.assertEquals(3, updatedAcc[0].Total_Email_Cases__c);
        
    }
}