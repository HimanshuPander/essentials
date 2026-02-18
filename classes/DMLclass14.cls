public class DMLclass14 {
    public static void myMethod(){
        Savepoint sp1 = Database.setSavepoint();		//Saving the state of the database
        
        try{
            Opportunity o = [Select Name, Account.ID, Amount, OwnerID from Opportunity where Name like 'Sell Lubri%' LIMIT 1];
            
            Decimal commission = o.Amount * 0.20;		//Calculating the commission of the agent
            
            o.amount = o.amount + commission;			//Updating the amount of Opportunity
            
            update o;		//1 st Database Operation, Updating the Opportuntiy record in Database
            
            
            Commission__c c = new Commission__c();
            c.Commision_Amount__c = commission;
            c.Agent__c = o.ownerId;
            
            insert c;		//2nd Database Operation
            
            Account acc2 = [Select Name from Account where id = :o.accountID];
            
            acc2.Commision_Percentage__c = 20;
            
            update acc2;		//3 rd Database Operation
        }
        catch(Exception e){
            Database.rollback(sp1);
        }
    }
}