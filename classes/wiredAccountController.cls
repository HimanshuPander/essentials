public with sharing class wiredAccountController {
    public wiredAccountController() {

    }

    @AuraEnabled(cacheable=true)
    public static List<Account> fetchAccountList(){
        try {
            List<Account> accountList = [SELECT Id, Name, Industry FROM Account WHERE Industry != NULL LIMIT 5];
            return accountList;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}