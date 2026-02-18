@isTest
public class AccountTriggerHandlerTest {
	@isTest
    private static void createRelatedContactTest(){
        List<Account> accList = new List<Account>();
        
        for(Integer i = 1; i <= 5; i++){
            Account acc = new Account();
            acc.Name = 'Test ' + i;
            accList.add(acc);
        }
        
        insert accList;
        
        List<Contact> conList = [SELECT Id FROM Contact WHERE AccountId =: accList[0].Id];
        System.assertEquals(1, conList.size());
    }
    
    @isTest
    private static void updateRatingTest(){
        List<Account> accList = new List<Account>();
        
        for(Integer i = 1; i <= 5; i++){
            Account acc = new Account();
            acc.Name = 'Test ' + i;
            acc.Industry = 'Media';
            accList.add(acc);
        }
        
        insert accList;
        
        List<Account> accListInserted = [SELECT Id, Rating FROM Account];
        System.assertEquals('Hot',accListInserted[0].Rating); 
    }
    
    @isTest
    private static void createRelatdOpportunity(){
        List<Account> accList = new List<Account>();
        
        for(Integer i = 1; i <= 5; i++){
            Account acc = new Account();
            acc.Name = 'Test ' + i;
            accList.add(acc);
        }
        
        insert accList;
        
        List<Opportunity> oppList = [SELECT Id FROM Opportunity WHERE AccountId =: accList[0].Id];
        System.assertEquals(1, oppList.size());
    }
}