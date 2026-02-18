public class ActionOnAccount {
	@InvocableMethod
    public static List<String> accountNames(List<Id> ids){
        
        List<String> accountNames = new List<String>();
        
        for(Account acc : [SELECT Name FROM Account WHERE Id IN : ids]){
            accountNames.add(acc.Name);
        }
    
    return accountNames;
    }
}