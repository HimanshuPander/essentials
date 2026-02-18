public class Apex7 {
    public static void myMethod(){
        
        //Creating and Initializing an Integer Set :-
        
        Set<Integer> sSet1 = new Set<Integer>();
        //Adding values to the Set
        sSet1.add(4);
        sSet1.add(9);
        sSet1.add(4);
        sSet1.add(5);
        
        //System.debug(sSet1);
        
        //Initializing and adding values together :-
        
        Set<Integer> sSet2 = new Set<Integer>{2,4,6};
            
            //Creating a String type Set :-
            
            Set<String> sSet3 = new Set<String>{'This', 'is', 'how', 'we', 'do', 'it'};
                
                
                
                
                
                
                
                
                //Uniqueness of sObjects :-
                
                Set<Account> sSetA = new Set<Account>();
        
        Account a1 = new Account(Name = 'Amazon', NumberOfEmployees = 20000);
        Account a2 = new Account(Name = 'Walmart', NumberOfEmployees = 20000);
        Account a3 = new Account(Name = 'Amazon', NumberOfEmployees = 20000);
        Account a4 = new Account(Name = 'Amazon');
        
        sSetA.add(a1);
        sSetA.add(a2);
        sSetA.add(a3);
        sSetA.add(a4);
        
        //System.debug(sSetA);
        //System.debug(sSetA.size());
        
        List<Integer> l1 = new List<Integer>{3,6,9};
            sSet2.addall(l1);		//This method also takes set as an argument
        System.debug(sSet2);		//{2,3,4,6,9} automatically sorted in Set
        
        if(sSet2.contains(12)){
            System.debug('This number is present in sSet2 Set');
        }else{
            System.debug('This number is not present in sSet2 Set');
        }
        
        if(sSet2.containsAll(l1)){
            System.debug('All the elements in list l1 are present in Set sSet2');
        }else{
            System.debug('All the elements are not present may be few one are there ');
        }
        
        System.debug(sSet2.size());
        System.debug(sSet2.retainAll(l1));
            
            System.debug(sSet2);
        
        Set<Integer> s = sSet2.clone();
        System.debug(s);
        
        s.remove(3);
        System.debug(s);
        
        s.clear();
        if(s.isEmpty()){
            System.debug('Set is Empty now ');
        }
    }
}