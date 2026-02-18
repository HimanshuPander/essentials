public class Apex6 {
    public static void myMethod(){
        List<List<List<Integer>>> list1 = new List<List<List<Integer>>>();
        
        	List<List<Integer>> subList1 = new List<List<Integer>>();
        	
        		List<Integer> subSubList1 = new List<Integer>();
        		
        			subSubList1.add(1);
        			subSubList1.add(2);
        			subSubList1.add(3);
        			subSubList1.add(4);
        		
        		List<Integer> subSubList2 = new List<Integer>();
        
        			subSubList2.add(5);
        			subSubList2.add(6);
        			subSubList2.add(7);
        			subSubList2.add(8);
        
        		List<Integer> subSubList3 = new List<Integer>();
        	
        			subSubList3.add(9);
        			subSubList3.add(10);
        			subSubList3.add(11);
        			subSubList3.add(12);
        
        		subList1.add(subSubList1);
        		subList1.add(subSubList2);
        		subList1.add(subSubList3);
        
				
        			
        			
        
        		List<List<Integer>> subList2 = new List<List<Integer>>();
        	
        		List<Integer> subSubList4 = new List<Integer>();
        		
        			subSubList4.add(13);
        			subSubList4.add(14);
        			subSubList4.add(15);
        			subSubList4.add(16);
        		
        		List<Integer> subSubList5 = new List<Integer>();
        
        			subSubList5.add(17);
        			subSubList5.add(18);
        			subSubList5.add(19);
        			subSubList5.add(20);
        
        		List<Integer> subSubList6 = new List<Integer>();
        	
        			subSubList6.add(21);
        			subSubList6.add(22);
        			subSubList6.add(23);
        			subSubList6.add(24);
        
        		subList2.add(subSubList4);
        		subList2.add(subSubList5);
        		subList2.add(subSubList6);
        
        		list1.add(subList1);
        		list1.add(subList2);
        
        		System.debug(list1);
        
    }
}