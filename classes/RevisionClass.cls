public class RevisionClass 
{
	public static void myMethod()
    {
        //Creating sObject of Account Object
        
        Account account1 = new Account();
        
        //Creating sObject of Contact Object
        
        Contact contact1 = new Contact();
        
        //*********Adding fields into sObject*******************
        
        //<<<<<<<<< Through Constructor>>>>>>>>>>>>>>>>>
        Account account2 = new Account(Name = 'Himanshu', NumberOfEmployees = 3000);
        Contact contact2 = new Contact(Title = 'Landlord', Department = 'Agriculture');
        
        //<<<<<<<<< Through Dot Notation>>>>>>>>>>>>>>>>
        
        account2.Name = 'Hrithik';
        contact2.Title = 'Business';
        
        //********************* GENERIC SOBJETS*****************************
        
        sObject sObject1 = new Account(Name = 'Namit', NumberOfEmployees = 2000);
        sObject sObject2 = new Contact(Title = 'Devops', Department = 'Information Technology');
        
        //<<<<<<<<<<<<<< Adding fields into Generic sObjects>>>>>>>>>>>>>>>>>>>>>>>>
        
        sObject1.put('NumberOfEmployees', 4500);
        sObject2.put('Title', 'Salesforce Developer');
        
        //<<<<<<<<<<<<< Accessing field values of Generic sObject>>>>>>>>>>>>>>>>>
        
        System.debug(sObject1.get('Name'));
        Integer i = (Integer)sObject1.get('NumberOfEmployees');
        System.debug(i);
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
      
        
        
        
        //Lists in Apex
        //Stored in Sequential Order
        //Can be duplicate
        // Syntax -        List<Datatype> lList = new List<Datatype>();
        
        //Example of Creating an Integer List
        
        List<Integer> l1 = new List<Integer>();
        
        //Adding values to a List
        
        l1.add(2);
        l1.add(4);
        l1.add(6);
        l1.add(4);
 
        //Initializing and adding values together
        
        List<Integer> l2 = new List<Integer>{2,4,6,4};
           
        //A String type List
        
        List<String> l3 = new List<String>{'I','am','feeling','good'};
            
        //List array notation
        
        Integer[] l4 = new Integer[4];
        
        //Or
        
        Integer[] l5 = new List<Integer>();
        
        //or
        
        List<Integer> l6 = new Integer[4];
        
        //Adding values using Array Notation
        l6[0] = 10;
        l6[1] = 20;
        l6[2] = 30;
        l6[3] = 40;
        
        System.debug(l6);		//(10,20,30,40)
        
        //Accessing Nth element of a List
        
        System.debug(l6[1]);	//20
        
        //Methods of List
        
        System.debug(l6.size());	//4
        System.debug(l6.get(2));	//30
        
        l6.remove(2);		//30 will be removed from the List
        System.debug(l6[2]);	//40
        System.debug(l6);	//(10,20,40)
        
        List<Integer> l7 = l6.clone();
        System.debug(l7);		//(10,20,40)
        
        l7.set(0,50);
        System.debug(l7);		//(50,20,40)
        
        l7.sort();
        System.debug(l7);		//(20,40,50)
        
        System.debug(l7.isEmpty());		//False
        
        l7.clear();
        
        System.debug(l7.isEmpty());		//True
        
        
        //Creating 2D List
        
        List<List<Integer>> List2D = new List<List<Integer>>();
        
        List<Integer> subList1 = new List<Integer>();
        subList1.add(10);
        subList1.add(20);
        subList1.add(30);
        subList1.add(40);
        List<Integer> subList2 = new List<Integer>();
        subList2.add(50);
        subList2.add(60);
        subList2.add(70);
        subList2.add(80);
        List<Integer> subList3 = new List<Integer>();
        subList3.add(90);
        subList3.add(100);
        subList3.add(110);
        subList3.add(120);
        
        //Adding all the subLists in the main list = List2D
        List2D.add(subList1);
        List2D.add(subList2);
        List2D.add(subList3);
        
        
        //Creating a 2D List with short code
        
        List<List<Integer>> List2D1 = new List<List<Integer>>
        {
            new List<Integer>{10,20,30},
            new List<Integer>{40,50,60},
            new List<Integer>{70,80,90}
        };
            
        
        //Creating a 3D List
        
        List<List<List<Integer>>> List3D = new List<List<List<Integer>>>();
        
        	List<List<Integer>> List_2D = new List<List<Integer>>();
        		List<Integer> list1 = new List<Integer>();
        			list1.add(10);
        			list1.add(20);
        			list1.add(30);
        			list1.add(40);
        		List<Integer> list2 = new List<Integer>();
        			list2.add(50);
        			list2.add(60);
        			list2.add(70);
        			list2.add(80);
        		List<Integer> list3 = new List<Integer>();
        			list3.add(90);
        			list3.add(100);
        			list3.add(110);
        			list3.add(120);
        	List<List<Integer>> List2D2 = new List<List<Integer>>();
        		List<Integer> list4 = new List<Integer>();
        			list4.add(130);
        			list4.add(140);
        			list4.add(150);
        			list4.add(160);
        		List<Integer> list5 = new List<Integer>();
        			list5.add(170);
        			list5.add(180);
        			list5.add(190);
        			list5.add(200);
        		List<Integer> list6 = new List<Integer>();
        			list6.add(210);
        			list6.add(220);
        			list6.add(230);
        			list6.add(240);
        	List<List<Integer>> List2D3 = new List<List<Integer>>();
        		List<Integer> list7 = new List<Integer>();
        			list7.add(250);
        			list7.add(260);
        			list7.add(270);
        			list7.add(280);
        		List<Integer> list8 = new List<Integer>();
        			list8.add(290);
        			list8.add(300);
        			list8.add(310);
        		List<Integer> list9 = new List<Integer>();
        			list9.add(320);
        			list9.add(330);
        			list9.add(340);
        			list9.add(350);
        
        
        
        	//Creating a 3D List with shorter code
        	
        List<List<List<Integer>>> List3D1 = new List<List<List<Integer>>>{
            new List<List<Integer>>{
                new List<Integer>{10,20,30},
                new List<Integer>{40,50,60},
                new List<Integer>{70,80,90}
            },
            new List<List<Integer>>{
                new List<Integer>{100,110,120},
                new List<Integer>{130,140,150},
                new List<Integer>{160,170,180}
            },
            new List<List<Integer>>{
                new List<Integer>{190,200,210},
                new List<Integer>{220,230,240},
                new List<Integer>{250,260,270}
            }
        };
            
            
        //Sets in Apex
        //Does not store values in Sequential Order
        //Values are unique
        
        //Syntax of Initializing a Set in Apex
        //Set<Datatype> s = new Set<Datatype>();
        
        //Creating & Initializing an Integer Set
        
        Set<Integer> s1 = new Set<Integer>();
        
        //Adding values to the Set
        s1.add(2);
        s1.add(4);
        s1.add(6);
        s1.add(4);
        
        //Initializing and adding values together
        
        Set<Integer> s2 = new Set<Integer>{2,4,6};
        
        //Creating a Strinp type Set
        
        Set<String> s3 = new Set<String>{'This','is','how','we','do','it'};
            
            
        //Uniqueness of sObjects
        
        Set<Account> sSet = new Set<Account>();
        
        Account a1 = new Account(Name = 'Amazon', NumberOfEmployees = 20000);
       	Account a2 = new Account(Name = 'Walmart', NumberOfEmployees = 20000);
        Account a3 = new Account(Name = 'Amazon', NumberOfEmployees = 20000);		//This will be skipped
        Account a4 = new Account(Name = 'Amazon');
        
        sSet.add(a1);
        sSet.add(a2);
        sSet.add(a3);
        sSet.add(a4);
        
        
        //Method of Sets
        
        List<Integer> lList1 = new List<Integer>{3,6,9};
        
        s2.addAll(lList1);		//This method also takes set as an argument
        
        
    }
}