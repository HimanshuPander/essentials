public class ExceptionHandling {
    public static void myMethod(integer i){
        
        System.debug('Hii');
        
        try{
            if(i == 0){
            	integer a;
	            integer b = a * 5;		//Throws NULL Pointer Exception   
            }else{
                Account acc = new Account();
                insert acc;				//ThrowsDMLException
            }
        }
        catch(NULLPointerException npe){
            System.debug('There is NUll Pointer Exception in the try block');
        }
        catch(DMLException de){
            System.debug('I will execute whenever there is any DML Exception in try block');
        }
        catch(Exception e){
            System.debug('I will excecute when there is any exception in the code except DML Exception');
        }
        finally{
            System.debug('I will execute always whether there is any exception occuring or not');
        }
        
        System.debug('Bieeee');
    }
}