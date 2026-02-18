public class SOQLClass2 
{
	public static void myMethod(String str)
    {
        //Static variable comparison
        
        List<Contact> conList1 = [Select Name, Email from Contact Where Name = 'Akash Deep'];
        
        for(Contact c : conList1)
        {
            System.debug('Name: ' + c.Name + ' Email: ' + c.Email);
        }
   
        //Dynamic variable comparison
        
        List<Contact> conList2 = [Select Name, Email from Contact Where Name = :str];
        
        for(Contact a: conList2)
        {
            System.debug('********** Name :********' + a.Name + '************** Email : *************' + a.Email);
        }
    }
}