public class DateClass 
{
	public static void myMethod()
    {
        //*********** Date Datatype ****************
        
       Date d1;
       d1 = Date.Today();		//Current Date
        
        Date d2 = Date.newInstance(2000, 04, 12);	//Custom Date
        System.debug(d1);
        System.debug(d2);
        System.debug(d1.toStartOfMonth());
        System.debug(d1.toStartOfWeek());
    }   
}