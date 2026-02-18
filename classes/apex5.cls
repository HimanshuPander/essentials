public class apex5 {
    public static void myMethod(){
        List<List<Integer>> list1 = new List<List<Integer>>();
        
        	List<Integer> l1 = new List<Integer>{10,20,30,40};
        	List<Integer> l2 = new List<Integer>{50,60,70,80};
            List<Integer> l3 = new List<Integer>{90,100,110,120};
                
         	list1.add(l1);
       		list1.add(l2);
       		list1.add(l3);
        
        	//System.debug(list1);
        	
        List<List<Integer>> list2 = new List<List<Integer>>{new List<Integer>{1,2,3,4}, new List<Integer>{5,6,7,8}, new List<Integer>{9,10,11,12}};
            
        System.debug(list2);
    }
}