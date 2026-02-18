public class DMLclass12 {
    public static void myMethod(){
        //Insert;
        
        List<Account> accList = new List<Account>();
        
        for(integer i = 1; i <= 20; i++){
            Account a = new Account(Name = 'Salesforce ' + i);
            accList.add(a);
        }
        
        insert accList;
        
        
        
        
        //Update
        
        List<Account> updateList = [Select Name from Account where CreatedDate = TODAY];
        
        for(Account a: updateList){
            a.name = a.name + ' Updated';
        }
        
        update updateList;
        
        
        
        //Upsert
        
        List<Account> upsertList = [Select Name, NumberOfEmployees from Account where CreatedDate = TODAY];
        
        for(Account a: upsertList){
            a.NumberOfEmployees = 10500;
        }
        
        for(integer i = 1; i <= 5; i++){
            Account a = new Account(Name = 'Salesforce Upsert Records' + i);
            upsertList.add(a);
        }
        
        upsert upsertList;
        
        
        
    }
}