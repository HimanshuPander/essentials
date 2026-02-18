public with sharing class AssignPrimaryContact {
    public AssignPrimaryContact() {
        System.debug('Assign Primary Class Working!');
    }

    @AuraEnabled(cacheable=true)
    public static List<Contact> fetchContacts(Id accountId){
        try {
            List<Contact> contactList = [SELECT Id, FirstName, Title FROM Contact WHERE AccountId =: accountId];
            return contactList;
        }
        catch(Exception e){
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static void assignPrimaryContactToAccount(Id contactId){
        try {
            System.debug('Received Contact Id: ' + contactId);
            Contact contactRecord = [ SELECT Id, AccountId FROM Contact WHERE Id =: contactId];

            if(contactRecord.AccountId != NULL){
                System.debug('Account Id not null');
                Account accountRecord = new Account(Id = contactRecord.AccountId,
                                                    Primary_Contact__c = contactRecord.Id);
                System.debug('Updated Account Details > ' + accountRecord);
                update accountRecord;
            }
        }
        catch(Exception e){
            throw new AuraHandledException(e.getMessage());
        }
    }

}