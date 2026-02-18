global class LeadUpdateBatch implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([Select AnnualRevenue from Lead]);
    }
    global void execute(Database.BatchableContext bc, List<Lead> lList){
        for(Lead l : lList){
            if(l.annualRevenue == null){
                l.annualRevenue = 1000000;
            }
        }
        update lList;
    }
    global void finish(Database.BatchableContext bc){
 		Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddress = new String[]{'himanshupander111@gmail.com'};
        mail.setToAddresses(toAddress);
        mail.setSubject('Batch Job Completed');
        mail.setPlainTextBody('Hey, The Batch job you started is successfully completed :)');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});
    }
}