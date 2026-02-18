public with sharing class userInputHandler {
    // public userInputHandler() {

    // }

    @AuraEnabled
    public static List<Account> fetchAccounts(String searchKey){
        try {
            List<Account> accList = [SELECT Id, Name FROM Account WHERE Name LIKE :('%' + searchKey + '%') ];
            return accList;
        } catch (QueryException e) {
            throw new AuraHandledException(e.getMessage());
        } catch (DmlException e) {
            throw new AuraHandledException(e.getMessage());  
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}