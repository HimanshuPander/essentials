@isTest
public class UpdateContactMailingAddressTest {
	@isTest
    private static void testBatchApexClass(){
        List<Account> accList = new List<Account>();
        
        for(Integer i = 0; i < 5; i++){
            accList.add(new Account(Name = 'Test' + i, Phone = '8696665359', BillingStreet = 'Salesforce Ki Duniya',
                                   BillingCity = 'Salesforce', BillingState = 'RJ', BillingCountry = 'India', BillingPostalCode = '335513'));
        }
        
        insert accList;
        
        List<Contact> conList = new List<Contact>();
        List<Id> accIds = new List<Id>();
        
        for(Account acc : accList){
            accIds.add(acc.Id);
            Contact con = new Contact();
            con.LastName = acc.Name;
            con.AccountId = acc.Id;
            conList.add(con);
        }
        
        insert conList;
        
        Test.startTest();
        UpdateContactMailingAddress accProcess = new UpdateContactMailingAddress();
        Id batchId = Database.executeBatch(accProcess);
        Test.stopTest();
        
        List<Contact> updatedConList = [SELECT Id, MailingStreet, MailingPostalCode, MailingCity, MailingState, MailingCountry FROM Contact WHERE AccountId =: accIds[0]];
    	
        System.assertEquals(accList[0].BillingCity, updatedConList[0].MailingCity);
        
        
        
        
        
    }
}