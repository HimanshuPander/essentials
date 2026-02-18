public class sObjectClass 
{
	public static void myMethod()
    {
        //****************		STANDARD OBJECT ****************
        
        //Create an Account sObject
        
        Account a1 = new Account();
        
        //Create an Contact sObject
        
        Contact c1 = new Contact();
        
        //***********	Assign field values to Account and Contact sObject ****************
        
        //Through Constructor
        
        Account a2 = new Account(name = 'Himanshu',NumberOfEmployees = 3000);
        Contact c2 = new Contact(firstname = 'Hrithik',lastname = 'Choudhary',Languages__c = 'Spanish');
        
        //Using Dot Notation
        
        a2.name = 'Namit';
        c2.lastname = 'Pander';
        
        //**********		CUSTOM OBJECTS		*****************
        
        //Create a Student sObject
        
        Student__c st1 = new Student__c(Student_Name__c = 'Himanshu');
       
        //Create a Faculty sObject
        
        Faculty__c ft1 = new Faculty__c(Name = 'Namit');
        
        //*********		GENERIC SOBJECTS	***************
        
        sObject s1 = new Account(Name = 'Ankit');
        sObject s2 = new Contact(firstName = 'Sanyam');
        sObject s3 = new Student__c(Student_Name__c = 'Aayush');
        
        //***********	TWIST WITH GENERIC SOBJECTS		***************
        //**********	SET A FIELD		************
        
        //s1.NumberOfEmployees = 3000;		This will not work
        
        s1.put('NumberOfEmployees',300);
        
        //***********		ACCESS A FIELD VALUE	*************
        
        //Integer i1 = s1.NumberOfEmployees;	This will not work
        
        Integer i1 = (integer)s1.get('NumberOfEmployees');
    }
}