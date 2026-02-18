public class DatabaseCMO {
    public static void myMethod(){
        
        //Database Class Methods Objects
        
        // 1. insert / update 		= save Result Class
        // 2. upsert				= upsert Result Class
        // 3. delete 				= delete Result Class
        // 4. undelete 				= undelete Result Class
        // 5. merge 				= merge Result Class
        // 6. lead convert 			= lead Convert Result Class
        // 7. emptyRecyclebin 		= empty Recyclebin Result Class
        
        
        List<Account> accList = new List<Account>();
        
        for(integer i = 1; i <= 20; i++){
            accList.add(new Account(Name = 'Database Class Methods Test ' + i, NumberOfEmployees = i));
        }
        
        accList.add(new Account());
        System.debug(accList.size());		//21
        
        Database.saveResult[] saveList = Database.insert(accList,false);
        
        for(Database.saveResult s : saveList){
            if(s.isSuccess()){
                System.debug('I was inserted Successfully = ' + s.getId());
            }
            else{
                System.debug('Record was not successful because of the following reasons : ');
                
                for(Database.error dr : s.getErrors()){
                    System.debug(dr.getStatusCode() + ' ' + dr.getMessage());
                    System.debug('The following fields were responsible for unsuccessful insertion of records : ' + dr.getFields());
                }
            }
        }
    }
}