public with sharing class AccountController {
    public AccountController() {

    }

    @AuraEnabled(cacheable = true)
    public static List<Account> getAccounts(){
        try {
            return [SELECT Id, Name, AnnualRevenue FROM Account ORDER BY AnnualRevenue DESC NULLS LAST LIMIT 5];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static List<Account> getTopAccounts(Integer count){
        try {
            return [SELECT Id, Name, NumberOfEmployees FROM Account ORDER BY AnnualRevenue DESC NULLS LAST LIMIT :count];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}