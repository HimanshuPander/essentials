public class dmlclass6 {
    public static void myMethod(){
        List<Opportunity> oppList = [Select closeDate from Opportunity where CreatedDate = LAST_90_DAYS];
       	Date d = System.today()+90;
        
        for(Opportunity o: oppList){
            o.closeDate = d;
        }
        
        update oppList;
    }
}