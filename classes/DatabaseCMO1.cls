public class DatabaseCMO1 {
    public static void myMethod(){
        
        List<Account> accList = [Select Name from Account where createdDate = TODAY];
        
        Database.deleteResult[] delList = Database.delete(accList,False);
        
        for(Database.deleteResult dr : delList){
            if(dr.isSuccess()){
                System.debug('Record deleted :');
            }
            else{
                System.debug('The following are the reasons for not successfully deletion of records');
                for(Database.error de : dr.getErrors()){
                    System.debug(de.getStatusCode() + ' ' + de.getMessage());
                    System.debug(de.getFields());
                }
            }
        }
    }
}