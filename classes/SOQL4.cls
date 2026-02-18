public class SOQL4 {
    public static void myMethod(){
        //******* Count
        
        Integer i = [Select Count() from Opportunity];
        
        //Will return the total number of Opportunities
        
        AggregateResult ar4 = [Select Count(Amount) from Opportunity];		//Same as Above
        
        AggregateResult ar5 = [Select Count(Amount) from Opportunity];
        
        //Will return the number of Opportunties having value in amount field and will not include the opportunt records having amount as null
        
        //Avg
        
        AggregateResult ar6 = [Select Avg(Amount) from Opportunity];
        
        //Will return the average Amount of all the Opportunities
        
        //Count Distinct
        
        AggregateResult ar7 = [Select Count_Distinct(Amount) from Opportunity];
        
        //Will return the number of Opportunity records having unique amount value and will also not include
        //Opportunities having null value in amount
        
        
        System.debug(ar7);
        //To access the value from AggregateResult Object
        
        Integer i2 = (Integer)ar7.get('expr0');
        System.debug(i2);
    }
}