public class TimeClass 
{
	public static void myMethod()
    {
       Time t1;		//Declaration of a variable
        t1= Time.newInstance(07, 54, 45, 59);
        
        System.debug(t1);
        System.debug(t1.addHours(5));
        System.debug(t1.addMinutes(2));
  
    }
}