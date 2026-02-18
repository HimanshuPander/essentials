public class SOQL9 {
    public static void myMethod(){
        //Multilevel Relationships in SOQL
        
        //Account			- 			Opportunity				-			Opportunity Line Item
        
        //Child  to Parent
        
        //Standard Object
        //1st Option
        
        List<OpportunityLineItem> oppLineList = [Select Name, Quantity, Opportunity.Name, Opportunity.Amount, Opportunity.Account.Name,Opportunity.Account.NumberOfEmployees from OpportunityLineItem];
 		
        
        
    }
}