public class UpdateAccounts {
    public static void updateAccount(){
        List<Account> accToBeUpdated = new List<Account>();
        Set<id> accIdSet = new Set<Id>();
        
        for(Contact con : [SELECT Id, AccountId FROM Contact WHERE Name LIKE '%Test%' AND AccountId != NULL]){
            if(!accIdSet.contains(con.AccountId)){
                Account acc = new Account();
                acc.Id = con.AccountId;
                acc.Active__c = 'Yes';
                acc.Rating = 'Hot';
                accToBeUpdated.add(acc);
                accIdSet.add(con.AccountId);
            }
        }
        
        if(!accToBeUpdated.isEmpty()){
            update accToBeUpdated;
        }
    }
}