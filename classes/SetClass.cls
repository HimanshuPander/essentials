public class SetClass 
{
    public static void myMethod()
    {
    	//Creating & Initializing an Integer Set
    	
        Set<Integer> s1 = new Set<Integer>();
        
        //Adding values to the Set
        
        s1.add(10);
        s1.add(20);
        s1.add(30);
        
        //Initializing & adding values together
        
        Set<Integer> s2 = new Set<Integer>{10,20,30};
            
        //Creating a String type Set
        
        Set<String> s3 = new Set<String>{'This','is','how','we','do','it'};
            
            
        
        //Uniqueness of sObjects :-
        
        Set<Account> sSet = new Set<Account>();
        
        Account a1 = new Account(Name = 'Amazon', NumberOfEmployees = 20000);
        Account a2 = new Account(Name = 'Walmart', NumberOfEmployees = 20000);
        Account a3 = new Account(Name = 'Amazon', NumberOfEmployees = 20000);
        Account a4 = new Account(Name = 'Amazon');
        
        sSet.add(a1);
        sSet.add(a2);
        sSet.add(a3);
        sSet.add(a4);
        
        System.debug(sSet);
        System.debug(sSet.size());		//3
        
        
        
        
        //Method of Sets :-
        
        List<Integer> l1 = new List<Integer>{3,6,9};
            
        s2.addAll(l1);		//This method also takes set as an argument
        
        System.debug(s2);	//Content in s2 = 10,20,30 before and after 3,6,9,10,20,30
     	
        System.debug(s2.contains(3));		//True
        
        System.debug(s2.contains(55));		//False
        
        System.debug(s2.containsAll(l1));	//True
        
        System.debug(s2.size());			//6
        
        System.debug(s2);					// (3,6,9,10,20,30)
        
        System.debug(s2.retainAll(l1));		// (3,6,9)
        
        System.debug(s2);					// (3,6,9)
        
        Set<Integer> s = s2.clone();
        
        s2.remove(3);
        
        System.debug(s2);					//(6,9)
        
        s2.clear();
        
        System.debug(s2.isEmpty());			//True
    }
}