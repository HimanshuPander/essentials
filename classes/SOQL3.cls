public class SOQL3 {
    public static void myMethod(){
        //SOQL Aggregate Functions
        
        //Sum
        
        AggregateResult ar1 = [Select Sum(Amount) from Opportunity];
        
        System.debug('Result is : ' + ar1);	//Will display the sum of Amount in all Opportunities
        
        //Max
        
        AggregateResult ar2 = [Select Max(Amount) from Opportunity];
        
        System.debug('Result is : ' + ar2);	//Will display the maximum amount in all Opportunities
        
        //Min
        
        AggregateResult ar3 = [Select Min(Amount) from Opportunity];
        
        System.debug('Result is : ' + ar3);	//Will display the minimum amount in all Opportunities
        
    }
}