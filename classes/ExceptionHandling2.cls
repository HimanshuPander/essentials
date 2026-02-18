public class ExceptionHandling2 {
    public static void myMethod(integer i){
        //		******** Common Exception Methods *****************
        
        try{
            if(i == 0){
                integer a;
                integer b = a * 5;		// Returns NullPointerException
            }
            else{
                Account acc = new Account();
                insert acc;				// Returns DMLException
            }
        }
        catch(Exception e){
            System.debug(e.getCause());		// Returns the cause of the Exception
            
            System.debug(e.getLineNumber());		// Returns the line number from where the exception was thrown.
            
            System.debug(e.getMessage());		// Returns the error message that displays for the user.
            
            System.debug(e.getStackTraceString());		//Returns the stack trace as a String
            
            System.debug(e.getTypeName());		//Returns the type of the Exception
        }
    }
}