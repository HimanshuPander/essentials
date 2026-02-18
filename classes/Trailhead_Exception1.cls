public class Trailhead_Exception1 {
	public static void sendEmail(String address, String subject, String body){
        //Create an Email Message Object
        
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {address};
        mail.setToAddresses(toAddresses);
        mail.setSubject(subject);
        mail.setPlainTextBody(body);
        
        // Pass this email message to the built-in sendEmail method of the Messaging class
        
        Messaging.SendEmailResult[] results = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
        
        //Call a helper method to inspect the returned results
        
        inspectResults(results);
    }
    
 	//Helper method
 	
    private static Boolean inspectResults(Messaging.SendEmailResult[] results){
        Boolean sendResult = true;
        
        //sendEmail returns an array of result objects.
        //Iterate through the list to insepect results
        //In this class, method sends only one email,
        //so we should have only one result
        
        for(Messaging.sendEmailResult res: results){
            if(res.isSuccess()){
                System.debug('Email sent successfully');
            }
            else{
                sendResult = false;
                System.debug('The following errors occured' + res.getErrors());
            }
        }
        
        return sendResult;
    }
}