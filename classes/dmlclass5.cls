public class dmlclass5 {
    public static void myMethod(){
        List<Account> accList = [Select Name from Account where Name like '%Test%' And isDeleted = TRUE ALL ROWS];
        
        undelete accList;
    }
}