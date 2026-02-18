public class ConversionClass 
{
	public static void myMethod()
    {
        Integer i = 20;
        Double d = i;
        
        Double d2 = 3.535;
       // Integer i1 = d2;		//Will give an error
        
        Integer i1 = (integer)d2;
        
        
        
        //Conversion of Strings and IDs
        
        String s = '123th329418279h';		//Will give an Error at Runtime because id does not exist 
        ID id1 = 'Himanshu';		//Will give an error at Runtime
        
        Integer i2 = 2147453647 + 5;
        Long l1 = 2147453647L + 5;
        
    }
}