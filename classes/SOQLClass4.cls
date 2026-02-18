public class SOQLClass4 
{
    public static void myMethod()
    {
    	//********** SOQL Keywords
	//
	//IN Keyword
	//
	//With List
	
    List<String> nameList = new List<String>{'John Bond','Himanshu Pander','Sourabh Kumar'};
    List<Contact> conList1 = [Select firstName, lastName, email from Contact Where name IN :nameList];
        
    for(Contact c: conList1)
    {
        System.debug('firstName :' + c.firstName + 'lastName :' + c.lastName + 'email : ' + c.email);
    }
    
    //With Set
    
    //Set<ID> idSet = new Set<ID>{'0036F00002bDj7DQAS','0036F0002bDj7KQAS'};
    //List<Contact> conList2 = [Select firstName, lastName, email from Contact Where ID IN :idSet];
        
    //Map cannot be used with IN keyword because it is not an iterable collection
    
    
        
        
        
        
    //*********** NOT
    
   // List<Contact> conList3 = [Select firstName, lastName, email from Contact Where name NOT IN :nameList];
    
  //  List<Contact> conList4 = [Select firstName, lastName, email from Contact Where ID NOT IN :idSet];
        
        
        
        
        
        
        
    //**********LIKE
    
    List<Account> accList = [Select name from Account Where name LIKE 'Genepoint'];
        
    //Wildcards
    //1. (Percentage)	=> 0 or multiple Characters
    //2. (Underscore)   => Single Character
    
    List<Account> accList1 = [Select name from Account Where name LIKE 'Burlington%'];
    List<Account> accList2 = [Select name from Account Where name LIKE '%Oil%'];
    List<Account> accList3 = [Select name from Account Where name LIKE '_Force'];
        
        
        
    //**************** AND / OR
     
    List<Opportunity> oppList1 = [Select name, Amount from Opportunity Where Amount > 100000 AND StageName = 'Closed-Won'];
    
    List<Opportunity> oppList2 = [Select Name, Amount from Opportunity Where Amount > 100000 OR StageName = 'Closed-Won'];
        
    
        
    //******************ORDER BY
    
    List<Opportunity> oppList3 = [Select Name, Amount from Opportunity Order By Amount];
        
    //Returns the list of opportunities sorted by the Amount in Ascending Order
    
    List<Opportunity> oppList4 = [Select Name, Amount from Opportunity Order By Amount ASC];
    
    //Same as above
    
    List<Opportunity> oppList5 = [Select Name, Amount from Opportunity Order By Amount DESC];
        
    //Returns the list of opportunities sorted by the Amount in Descending Order
    
    List<Opportunity> oppListy6 = [Select Name, Amount from Opportunity Order By Amount NULLS FIRST];
        
    //Return the list of opportunities sorted by Amount and having Nulls First(Default)
    
    List<Opportunity> oppList7 = [Select Name, Amount from Opportunity Order By Amount NULLS LAST];
     
    //Returns the list of Opportunities sorted by the Amount and having NULLS Last
    
       
        
        
    //***************************Group By
    
    List<AggregateResult> agrOpp1 = [Select StageName from Opportunity Group By StageName];
    
    //This will return all the values we have in StageName field of Opportunity
    
    List<AggregateResult> agrOpp2 = [Select Count(ID) from Opportunity Group By StageName];
      
    //Will return the total number of Opportunities groups by Stage
    //
    //Count() cannot be used with group by, we need to put ID or any other field in it
    
        
    List<AggregateResult> agrOpp3 = [Select StageName, Count(ID) from Opportunity Group By StageName];
        
    //We can only include the field in the query by which we are grouping the result
    
        
    List<AggregateResult> agrOpp4 = [Select StageName, Max(Amount) from Opportunity Group By StageName];
        
    //Will return the maximum amount within that particular stage
    //
    //We can use below mentioned aggregate functions with Group By , like:
    //1. AVG()
    //2. Count()
    //3. Min()
    //4. Max()
    //5. Sum()
    //6. Count_Distinct()
    
        
        
        
    //************** LIMIT
    
    List<Account> accList4 = [Select Name from Account LIMIT 10];
        
    //Will return only 10 Accounts
    
        
    List<Account> accList5 = [Select Name from Account LIMIT 1];
      
    //This list will have only one sObject
    
        
    Account a = [Select Name from Account LIMIT 1];
        
    //This query will only return only one sObject
    
        
        
    //********************* FOR UPDATE
    
    List<Account> accList6 = [Select Name from Account FOR UPDATE];
        
    
        
        
        
    //****************** ALL Rows
    
    List<Account> accList7 = [Select Name from Account ALL ROWS];
        
    //This will return all the account object records including the deleted ones.
    
    List<Account> accList8 = [Select Name from Account Where isDeleted = true ALL ROWS];
        
    //This will return all the deleted account object records
    
    List<Account> accList9 = [Select Name from Account Where isDeleted = true];
        
    //This will not return any records as we have not used ALL ROWS Keyword
        
    
    }
	
}