public class SOQL6 {
    public static void myMethod(){
        //Date Literals
        
        List<Account> accList;
        
        //yesterday

        accList = [Select Name from Account where createdDate = Yesterday];
        
        //today
        
        accList = [Select Name from Account where createdDate = Today];
        
        //tomorrow
        
        accList = [Select Name from Account where createdDAte = Tomorrow];
        
        //Last_week/ last_month
        
        accList = [Select Name from Account where createdDate = last_week];
        
        accList = [Select Name from Account where createdDate = last_month];
    }
}