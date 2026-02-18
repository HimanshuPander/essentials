public class StringClass
{
	public static void myMethod()
    {
        String s = 'Himanshu';
        String s1 = 'Pander';
        
        String s2 = s + s1;		//HimanshuPander
        
        s2 = s2 + ' is SALESFORCE DEVELOPER';		//HimanshuPander is SALESFORCE DEVELOPER	
        
        System.debug(s2);
    }
}