public class SOQLClass7 
{
	public static void myMethod()
    {
        //Dynamic SOQL
        
        
        String a = 'Select Name from Account';
        
        List<sObject> acList = Database.query(a);
        
        
        
        
        //Creating the string query dynamically
        
        String qr = 'Select ID';
        
        String [] fieldList = new List<String>();
        
        fieldList.add('Name');
        fieldList.add('NumberOfEmployees');
        fieldList.add('Phone');
        
        
        String objName = 'Account';
        
        for(String f: fieldList)
        {
            qr += ', ' + f;
        }
        
        //qr = Select ID, Name, NumberOfEmployees, Phone
        
        qr += ' from ' + objName;
        
        //qr = Select ID, Name, NumberOfEmployees, Phone from Account
        
        
        String s = String.escapeSingleQuotes(qr);
        
        List<sObject> list2 = Database.query(s);
        
        
        
        //Query Esception
        
        String s1 = 'Select Name, PhoneNumber from Account';
        
        List<sObject> list3 = Database.query(s1);
        
        //This will throw a QueryException
    }
}