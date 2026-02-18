public class sObjectClass1 
{
    public static void myMethod()
    {
        //*************STANDARD OBJECTS ********************8
        //Create an Account sObject
        
        Account a1 = new Account();
        
        //Create an Contact sObject
        
        Contact c1 = new Contact();
        
        //***********Setting fields in sObject
        
        //Through Constructor
        
        Account a2 = new Account(name = 'Himanshu',NumberOfEmployees = 3000);
        Contact c2 = new Contact(firstname = 'Hrithik',lastname = 'Choudhary',Languages__c = 'Spanish');
        
        //Through Dot Notation
        
        a2.name = 'Namit';
        a2.NumberOfEmployees = 3000;
        
        c2.FirstName = 'Sanyam';
        c2.LastName = 'Garg';
        c2.Languages__c = 'Hindi';
        
        //***************** CUSTOM OBJECTS*****************
        
        Student__c st1 = new Student__c(Student_name__c = 'Himanshu');
        
        //********* GENERIC OBJECTS*****************
        
        sObject s1 = new Account(name = 'Sanyam',NumberOfEmployees = 2000);
        
        sObject s2 = new Contact(Title = 'Aayush');
        
        sObject s3 = new Student__c(Student_Name__c = 'Hrithik');
        
        //***********TWIST WITH GENERIC SOBJECTS *****************8
        //Setting a field in sObject
        
        s1.put('Name','Sahil');
        s3.put('Student_name__c' , 'Himanshu');
        
        //**************** Accessing field value of sObjects
        
        s1.get('name');
        s2.get('name');
        s3.get('Student_name__c');
        
        Integer i1 = (integer)s1.get('NumberOfEmployees');
        System.debug(i1);
    }
}