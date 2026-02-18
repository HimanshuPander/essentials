public class dmlclass8 {
    public static void myMethod(){
        List<Contact> cList5 = [Select Name, Id from Contact];
        Map<String, ID> mMap = new Map<String, ID>{};
        
        for(Contact c: cList5){
            mMap.put(c.name, c.id);
        }
        
        List<Contact> uniqList = new List<Contact>{};
        List<Contact> delList = new List<Contact>{};
            
        Set<String> s1 =  mMap.keySet();
        Set<Id> uniqSet = new Set<Id>{};
            
        for(String s : s1){
           uniqSet.add(mMap.get(s));
        }
        
        for(Contact c: cList5){
            if(uniqSet.contains(c.id))
                uniqList.add(c);
            else{
                delList.add(c);
            }
        delete dellist;
        }
        
                
    }
}