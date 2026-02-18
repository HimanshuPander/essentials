public class DMLclass11 {
    public static void myMethod(){
        //Best Practices
        //
        //1. Not Exceeding total number of allowed SOQL queries in Apex
        //Inappropriate Way
        
        List<Account> accList = [Select Name, ID from Account where CreatedDate = Last_Week];
        
        for(Account a: accList){
            List<Opportunity> oppList = [Select Name, ID from Opportunity where AccountId = :a.id];
        
            for(Opportunity o: oppList){
                System.debug('Opportunity' + o.Name + 'is on Stage ' + o.StageName);
            }
        }
        
        
        //Appropriate Way
        
        List<Account> accList2 = [Select Name, Id from Account where CreatedDate = LAST_WEEK];
        List<Opportunity> oppList2 = [Select Name, Id from Opportunity where AccountId IN :accList2];
        
        for(Opportunity o: oppList2){
            System.debug('Opportunity ' + o.Name + ' is on Stage ' + o.StageName);
        }
        
        
        
        //2. Not Exceeding total number of allowed DML Statements in Apex
        
        //Inappropriate way
        
        for(integer i = 0; i < 100; i++){
            Account a = new Account(Name = 'Acc ' + i);
            insert a;
        }
        
        //Appropriate way
        
        List<Account> accListInsert = new List<Account>();
        
        for(integer i = 0; i < 100; i++){
            Account a = new Account(Name = 'Account ' + i);
            accListInsert.add(a);
        }
        
        insert accListInsert;
    }
}