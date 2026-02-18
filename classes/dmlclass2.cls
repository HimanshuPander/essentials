public class dmlclass2 {
    public static void myMethod(){
        List<Account> accList = [Select Name from Account where CreatedDate = TODAY];
        
        for(Account a: accList){
            a.Name = a.Name + ' Updated';
        }
        
        update accList;
    }
}