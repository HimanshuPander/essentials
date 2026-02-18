public class dmlclass3 {
    public static void myMethod(){
        List<Account> accList = [Select Name, NumberOfEmployees from Account where CreatedDate = TODAY];
        
        for(Account a: accList){
            a.NumberOfEmployees = 10500;
        }
        
        for(Integer i = 0; i < 50; i++){
            Account a = new Account(Name = 'New Records in Upsert ' + i);
            accList.add(a);
        }
        
        upsert accList;
    }
}