public class TwoDListClass
{
	public static void myMethod()
    {
        //Creating 2D List in Apex
        List<List<Integer>> lList = new List<List<Integer>>();
        
        List<Integer> l1 = new List<Integer>{10,20,30};
        List<Integer> l2 = new List<Integer>{40,50,60};
        List<Integer> l3 = new List<Integer>{70,80,90};
            
        lList.add(l1);
        lList.add(l2);
        lList.add(l3);
        
        //Another way of Creating a 2D array
        
        List<List<Integer>> lList1 = new List<List<Integer>>{
            new List<Integer>{10,20,30},
            new List<Integer>{40,50,60},
            new List<Integer>{70,80,90}
        };
            
        System.debug(lList);
        
        //Creating a 3D List in Apex
       	
        List<List<List<Integer>>> List3D = new List<List<List<Integer>>>{
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
            
        System.debug(List3D);
        
    }
}