public class Apex8 {
    public static void myMethod(){
        Map<Integer,String> mMap = new Map<Integer,String>();
        
        //Adding values to Map
        
        mMap.put(11,'Jack');
        mMap.put(21,'John');
        mMap.put(32,'Ron');
        
        System.debug(mMap);		// {11 => Jack, 21 => John, 32 = Ron}
        
        mMap.put(11, 'Himanshu');
        System.debug(mMap);
        
        //Initializing and adding values together
        
        Map<Integer, String> m1 = new Map<Integer, String>{1 => 'Sanyam', 2 => 'Aayush', 3 => 'Anku', 4 => 'Sudhakar'};
            
            System.debug(m1);
        
        mMap.putAll(m1);
        
        System.debug(mMap);
        System.debug(mMap.get(11));
        
        List<String> l1 = new List<String>();
        l1 = mMap.values();
        
        System.debug(l1);
        
        Map<Integer, String> mMap1 = new Map<Integer, String>();
        mMap1 = mMap.clone();
        
        System.debug(mMap1);
        System.debug(mMap1.keySet());
        
        if(mMap1.containsKey(3)){
            System.debug('This key is available in Map');
        }
        
        mMap1.remove(2);		//Removes the element of Key 2
		mMap1.clear();
        if(mMap1.isEmpty()){
            System.debug('Map is Empty now !');
        }      
        
        System.debug(mMap.size());
    }
}