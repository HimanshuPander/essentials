public class apex4 {
    public static void myMethod(){
       	//Initializing List in Apex
       	
        List<Integer> list1 = new List<Integer>(4);
        List<Integer> list2 = new List<Integer>{5,9,1,2};
        
        //list1.add(5);
        //list1.add(4);
        //list1.add(9);
        //list1.add(3);
        
        list1[0] = 1;
        list1[1] = 2;
        list1[2] = 3;
        list1[3] = 4;
        
        //System.debug('Size of List 2 is : ' + list2.size());
        //System.debug('Item at Position 2 is :' + list2.get(1));
        //list2.remove(2);
        //System.debug('Item Removed at Postion 3 : ');
        //System.debug(list2);
        //System.debug('Item at Postion 3 is : ' + list2.get(2));
        List<Integer> list3 = list2.clone();
        System.debug(list3);
        //System.debug(list2);
        
        list3.sort();
        System.debug(list3);
        
       	list3.clear();
        if(list3.isEmpty() == true){
            System.debug('List3 is Empty right now !');
        }
        
        
        
        
    }
}