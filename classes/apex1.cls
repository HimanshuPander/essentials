public class apex1 {
    public static void myMethod(){
        //Creating an account sObject
        
        Account a1 = new Account();
        
        //Create a Contact sObject
        
        Contact c1 = new Contact();
        
        //********** Assign field values to Account and Contact sObjects ********
        //
        //Through Constructor
        
        Account a2 = new Account(Name = 'Amazon');
        Contact c2 = new Contact(firstName = 'Mod',lastName = 'Max',Languages__c = 'Spanish');
        
        //System.debug(a2);
        //System.debug(c2);
        
        //Through Dot Notation
       	
        a2.Name = 'Flipkart';
        a2.NumberOfEmployees = 3000;
        
        c2.firstName = 'Himanshu';
        c2.LastName = 'Pander';
        c2.Languages__c = 'English';
        
        //System.debug(a2);
        //System.debug(c2);
        
        //Custom Objects
        
        //Create a Student sObject
        
        Student__c st1 = new Student__c(Student_Name__c = 'Amit');
        //System.debug(st1);
        
        
        //Generic sObjects
        
        sObject s1 = new Account(Name = 'Amazon');
        sObject s2 = new Contact(lastName = 'Person');
        sObject s3 = new Student__c(Student_Name__c = 'Jessica');
        
        //Twist with Generic sObjects**************
        
        //Set a field
        
       // s1.NumberOfEmployees = 3000;		//This will not work
        s1.put('NumberOfEmployees',4000);
        
        //Access a field value
        
      //  Integer i = s1.NumberOfEmployees;		//This will not work
        
        Integer i1 = (integer)s1.get('NumberOfEmployees');
        
        System.debug(i1);
        
    }
}