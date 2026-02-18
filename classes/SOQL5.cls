public class SOQL5 {
    public static void myMethod(){
        //****** IN
        
        //With List
        
        List<String> nameList = new List<String>{'John','Max','Jeff'};
            
     	List<Contact> conList1 = [Select firstName, lastName, email from Contact Where Name IN : nameList];
        
        //With Set
        
        Set<ID> idSet = new Set<Id>{'0036F00002bDj7DQAS','0036F00002bDj7KQAS'};
        List<Contact> conList2 = [Select firstName, lastName, email from Contact where ID IN : idSet];
        
        //NOTE :- Map cannot be used with IN keyword because it is not an iterable collection
        
        //******** NOT
        
        List<Contact> conList3 = [Select firstName, lastName, email from Contact Where Name Not IN : nameList];
        
        List<Contact> conList4 = [Select firstName, lastName, email from Contact Where ID Not IN : idSet];
        
        
        //********* LIKE
        
        List<Account> accList = [Select Name from Account Where Name Like 'Genepoint'];
        
        //Wildcards 1.(Percentage) => 0 or multiple characters
        //			2.(Underscore) =>Single Character
        
        List<Account> accList1 = [Select Name from Account Where Name Like 'Burlington %'];
        
        List<Account> accList2 = [Select Name from Account Where Name Like '%Oil%'];
        
        List<Account> accList3 = [Select Name from Account Where Name Like '_Force'];
        
        //********** And / Or
        
        List<Opportunity> oppList1 = [Select Name, Amount from Opportunity Where Amount > 100000 And StageName = 'Closed-Won'];
        List<Opportunity> oppList2 = [Select Name, Amount from Opportunity Where Amount > 100000 OR StageName = 'Closed-Won'];
        
        //****** Order By
        
        List<Opportunity> oppList3 = [Select Name, Amount from Opportunity Order By Amount];
        
        //Returns the list of Opportunities sorted by the Amount in ASC Order
        
        List<Opportunity> oppList4 = [Select Name, Amount from Opportunity Order By Amount ASC];
        //Same as Above
        
        List<Opportunity> oppList5 = [Select Name, Amount from Opportunity Order By Amount DESC];
        
        //Returns the list of Opportunities sorted by the Amount in Descending Order
        
        List<Opportunity> oppList6 = [Select Name, Amount from Opportunity Order By Amount NULLS FIRST];
        
        //Returns the List of Opportunities sorted by the Amount and having nulls first (default)
        
        List<Opportunity> oppList7 = [Select Name, Amount from Opportunity Order By Amount NULLS LAST];
        
        //Returns the list of Opportunities sorted by the Amount and having nulls last
        
        
        //************* Group By
        
        List<AggregateResult> agrOpp1 = [Select StageName from Opportunity Group By StageName];
        
        //This will return all the values we have in StageName field of Opportunity
        
        List<AggregateResult> agrOpp2 = [Select Count(ID) from Opportunity Group By StageName];
        
        //Will return the total no. of Opportunities grouped by stage
        
        //Count() cannot be used with group by , we need to put Id or any other field in it.
        
        List<AggregateResult> agrOpp3 = [Select StageName, Count(ID) from Opportunity Group By StageName];
        
        //We can only include the field in the query by which we are grouping the result.
        
        List<AggregateResult> agrOpp4 = [Select StageName, Max(Amount) from Opportunity Group By StageName];
        
        //Will return the maximum amount within that particular stage
        
        
        //************* LIMIT
        
        List<Account> accList4 = [Select Name from Account LIMIT 1];
        //This list will have only one sObject
        
        List<Account> accList5 = [Select Name from Account LIMIT 10];
        //Will return only 10 Accounts
        
        Account a = [Select Name from Account LIMIT 1];
        
        //This query will return only one sObject
        
        //********* For Update
        
        List<Account> accList6 = [Select Name from Account FOR UPDATE];
        
        //******* ALL ROWS
        
		List<Account> accList7 = [Select Name from Account ALL ROWS];
        
        //This will return all the account object records including the deleted ones.
        
        List<Account> accList8 = [Select Name from Account where isDeleted = true ALL ROWS];
        
        //This will return all the deleted account object records
        
        List<Account> accList9 = [Select Name from Account where isDeleted = true];
        
        //This will not return any records as we have not used ALL ROWS keyword
        
        
            
    }
}