public class SampleClass2 {
    public static void myMethod(List<Integer> iList1,List<Integer> iList2,List<Integer> iList3){
        
        List<Integer> iList4 = new List<Integer>();
        
        Integer i1 = iList1.size();
        Integer i2 = iList2.size();
        Integer i3 = iList3.size();
        
        if(i1 <= i2){
            if(i1 <= i3){
                for(Integer i = 0; i < i1; i++){
                    if(iList2.contains(iList1[i]) && iList3.contains(iList1[i]))
                    {
                        iList4.add(iList1[i]);
                    } 
                }
            }
            else{
                for(Integer i = 0; i < i3; i++){
                    if(iList1.contains(iList3[i]) && iList2.contains(iList3[i]))
                    {
                        iList4.add(iList3[i]);
                    } 
                }
            }
        }else if(i2 <= i1){
            for(Integer i = 0; i < i2; i++){
                    if(iList1.contains(iList2[i]) && iList3.contains(iList2[i]))
                    {
                        iList4.add(iList2[i]);
                    } 
                }
        }
        
        
        
        
        
        
        System.debug(iList4);
        
    }
}