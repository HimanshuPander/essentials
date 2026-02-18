public class SOQL8 {
    public static void myMethod(){
        //Relationship Queries
        //There are 2 types of relationship queries
        //1. Child to Parent Relationship Queries
        //2. Parent to Child Relationship Queries
        //
        //Child to Parent
        //Standard Object
        
        List<Contact> conList = [Select firstName,lastName, Account.Name, Account.NumberOfEmployees from Contact];
        
        //Here Account is the parent object's reference which is relationship field's name on child object
        
        
        //Custom Object
        
        List<Rating__c> ratList = [Select Name, Rating_For__c,Rating_Out_Of_10__c, Rating_given_to_which_Student__r.Name, Rating_given_to_which_Student__r.Student_Email__c from Rating__c];
        
        //Here Student__r is the parent object's reference which is relationship field's name on child object + __r
        
        //While writing a Child to Parent relationship Query, we just have to write down the field name instead of object name of the relationship
        //field with the help of which we have created that relationship in order to traverse to the parent object
        //
        //If the relationship is Custom than we will have to append __r at the end of it.
        //
        //
        //
        //
        //
        //Parent to Child
        //
        //Standard Object
        
        List<Account> accList = [Select Name, NumberOfEmployees, (Select lastName, Phone from Contacts) from Account];
        
        //Here Contacts is the child relationship name
        //&
        //(Select lastName, Phone from Contacts) is a subquery/ innerquery
        //
        //In parent to Child relationship queries we write an inner query.
        //In the Inner query, instead of writing down object name, we write down the child relationship name(
        //We can get this child realtionship name on the relationship field's description).
        //
        //If it is a Custom relationship then we will append this Child Relationship Name with __r
        //
        //
        //Custom Object
        
        List<Student__c> stList = [Select Name, Student_Email__c, Student_Name__c, (Select Name, Rating_For__c, Rating_Out_Of_10__c from Ratings__r) from Student__c];
        
        //Here Ratings is the child relationship name which needs to appended with __r in case of a custom relationship 
		//&
		//(Select Name, Rating_For__c, Rating_Out_Of_10__c from Ratings__r) is a subquery.
        
    }
}