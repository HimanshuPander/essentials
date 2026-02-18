public class UpdateContactMailingAddress implements Database.Batchable<sObject>, Database.stateful {
	
    public Integer totalRecords = 0;
    
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([SELECT Id, BillingCity, BillingState, BillingCountry, BillingPostalCode, BillingStreet,
                                        (SELECT Id, AccountId, MailingCity, MailingState, MailingCountry, MailingPostalCode, MailingStreet FROM Contacts)
                                        FROM Account WHERE Phone = '8696665359']);
    }
    
    public void execute(Database.BatchableContext bc, List<Account> accList){
        
        List<Contact> conToBeUpdated = new List<Contact>();
        
        for(Account acc : accList){
            for(Contact con : acc.Contacts){
                con.MailingCity = acc.BillingCity;
                con.MailingState = acc.BillingState;
                con.MailingCountry = acc.BillingCountry;
                con.MailingPostalCode = acc.BillingPostalCode;
                con.MailingStreet = acc.BillingStreet;
                conToBeUpdated.add(con);
                totalRecords = totalRecords + 1;
            }
        }
        
        if(!conToBeUpdated.isEmpty()){
            update conToBeUpdated;
        }
    }
    
    public void finish(Database.BatchableContext bc){
        System.debug('Total Contacts Updated : ' + totalRecords);
    }
}