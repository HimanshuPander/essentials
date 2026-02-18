public class AccountCalculator {
	@future
    public static void countContacts(List<id> ids){
        List<Account> accList = [SELECT Id, (SELECT Id FROM Contacts) FROM Account WHERE Id IN : ids];
        
        for(Account acc : accList){
            acc.Total_Contacts__c = acc.Contacts.size();
        }
        
        if(!accList.isEmpty()){
            update accList;
        }
        
    }
}