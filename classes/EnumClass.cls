public class EnumClass 
{
	public static void myMethod()
    {
        Season s = Season.Winter;
        s = Season.Fall;
        
        //s = 123;		//Will give an Error
        //s = 'Monsoon';	//Will give an Error
    }
}