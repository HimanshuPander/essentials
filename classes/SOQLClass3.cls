public class SOQLClass3 
{
	public static void myMethod()
    {
        //**** SOQL Return Types ****
        
        //**** SUM 
        
        AggregateResult ar1 = [Select Sum(Amount) from Opportunity];
        
        System.debug('Result is ' + ar1);		//Will display the sum of Amount in all Opportunities
    }    
}