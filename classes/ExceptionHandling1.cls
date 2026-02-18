public class ExceptionHandling1 {
    public static void myMethod(integer i){
        
        //1. DMLException 
        try{
            Account a = new Account();
            insert a;			// Returns DMLException Class Object
        }
        catch(DMLException e){
            System.debug('The Record cannot be inserted : ' + e.getMessage());
        }
        
        
        // 2. List Exception
        
        try{
            List<String> stList = new List<String>{'Himanshu','Shrey','Namit'};
                
            System.debug(stList.get(0));		// Himanshu
            System.debug(stList.get(1));		// Shrey
            System.debug(stLIst.get(2));		// Namit
            
            System.debug(stList.get(3));		//Will return ListException Class Object
        }
        catch(ListException le){
            System.debug('There is no value on this index or this index doesn\'t exist ' + le.getMessage());
        }
        
        
        // 3.Query Exception
        
        try{
            Opportunity o = [Select name from Opportunity where name like 'Edge%'];		//This will return QueryException Class Object
        }
        catch(QueryException qe){
            System.debug('There was the problem with this query :  ' + qe.getMessage());
        }
        
        
        // 4. NullPointerException
        
        try{
            integer a;
            integer b = a * 5;			//This will return NullPointerException Class Object
            
            //Example 2
            
            List<Integer> intList;
            intList.add(30);			//This will also return NullPointerException Class Object
            
            //Example 3
            
            Account acc;
            acc.Name = 'Disney';		//This is also going to return NullPointerException Class Object
        }
        catch(NullPointerException npe){
            System.debug('There is no object in the reference variable ' + npe.getMessage());
        }   
            
            
        // 5. sObject Exception
        
            try{
                List<Account> accList = [Select name from Account];
                
                for(Account a : accList){
                    System.debug(a.NumberOfEmployees);
                }
            }
        catch(sObjectException soe){
            System.debug('There is the problem with this query : ' + soe.getMessage());
        }
        
        // 6. Generic Exception
        
        try{
            List<Account> accList = [Select name, numberOfEmployees from Account];
            
            for(Account a : accList){
                System.debug(a.NumberOfEmployees);
            }
        }
        catch(Exception e){
            System.debug('This is a generic exception ' + e.getMessage());
        }
        
        
        //Another Example
        
        try{
            if(i == 0){
                integer a;
                integer b = a * 5;							//Returns NullPointerException
            }else{
                Account acc = new Account();
                insert acc;				//Returns DMLException
            }
        }
        catch(NullPointerException npe){
            System.debug('I execute when a NullPointerException occurs in the try block');
        }
        catch(DMLException de){
            System.debug('I execute when a DMLException occurs in the try block');
        }
        catch(Exception e){
            System.debug('I execute when there is any other exception except NullPointerException and DMLException in the try block');
        }
    }
}