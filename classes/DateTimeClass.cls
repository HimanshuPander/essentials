public class DateTimeClass 
{
	public static void myMethod()
    {
        DateTime dt1 = DateTime.newInstance(2022,01,01,09,20,30);
        DateTime dt2 = Datetime.now();
        
        System.debug(dt1);
        System.debug(dt2);		//Returns current Date & Time
    }
}