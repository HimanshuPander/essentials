public class SOQLClass5 
{
	public static void myMethod()
    {
        //Relationship Queries
        //
        //****************Child to ParentStud
        //
        //Standard Object
        
        List<Contact> conList = [Select firstName, lastName, Account.Name, Account.NumberOfEmployees from Contact];
        
        //Here Account is the parent Object's reference which is relationship field's name on child object
        
        
        //Custom Object
        
        List<Rating__c> ratList = [Select name, Rating_For__c, Rating_Out_Of_10__c, Rating_given_to_which_Student__r.Name, Rating_given_to_which_Student__r.Student_Email__c from Rating__c];
        
        //Here Rating_given_to_which_Student__r is the parent object's reference which is relationship field's name on child object + __r
        
        
        
        
        
        
        
        
        
        
        //Parent to Child
        //
        //****************** Standard Object
        
        List<Account> accList = [Select name, NumberOfEmployees, (Select lastName, Phone from Contacts) from Account];
        
        //Here Contacts is the child relationship name
        //&&
        //(Select lastName, Phone from Contact) is a subquery / inner query
        
        
        
        
        //Custom Object
        
        List<Student__c> stList = [Select name, Student_Email__c, Student_Name__c, (Select Name, Rating_For__c, Rating_Out_Of_10__c from Ratings__r) from Student__c];
        
        
        
    }
}