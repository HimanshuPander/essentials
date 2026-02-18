public class DatabaseClass {
    public static void myMethod(){
        //Database Class Methods
        
        
        //Empty Recycle Bin
        
        List<Contact> conList = [Select ID from Contact where isDeleted = true ALL ROWS];
        Database.emptyRecycleBin(conList);
        
        //Count Query
        
        //The below Dynamic SOQL will not work
        
        //Integer i1 = Database.query('Select count() from Account');
        
        Integer i1 = Database.countQuery('Select count() from Account');
        
        System.debug(i1);			//Number of Records
        
        //Integer i2 = Database.countQuery('Select count(ID) from Account');		//***** Exception ******
        
        
        //The returntype of count() aggregate function is Integer and Database.query() method's returntype
        //is List<sObject> . So, that's why we can't use count aggregate function with Database.query() method. 
        //For this, special method is there in Database class named as Database.countQuery() method.
        //
        //We can't use any field inside count() function in Database.countQuery() method because as we pass the field
        //name inside count(), it's returntype soon becomes an AggregateResult type and returntype of countQuery() method
        //is an Integer type. So, there will be a mismatch between both the types and thus will give an Exception
    }
}