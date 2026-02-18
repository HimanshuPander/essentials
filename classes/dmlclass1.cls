public class dmlclass1 {
    public static void myMethod(){
        List<Account> accList = new List<Account>();
        
        for(Integer i = 1; i <= 20; i++){
            Account a = new Account(Name ='Monsoon Test' + i);
            accList.add(a);
        }
        
        insert accList;
    }
}