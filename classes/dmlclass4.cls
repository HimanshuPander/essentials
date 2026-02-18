public class dmlclass4 {
    public static void myMethod(){
        List<Account> accList = [Select Name from Account where Name like '%Test%'];
        
        delete accList;
    }
}