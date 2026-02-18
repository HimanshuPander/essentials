public class SOQLClass1 
{
	public static void myMethod()
    {
        List<Account> accList = [Select Name, NumberOfEmployees from Account];
            
         //For Loop
         
         for(integer i = 0; i < accList.size(); i++)
         {
             System.debug(accList[i].NumberOfEmployees);
         }
         
        
         //For Each Loop
         
         for(Account a:accList)
         {
             System.debug('***************Acc Name ****************' + a.Name + '***************** NumberOfEmp **********' + a.NumberOfEmployees);
         }
         
    }
}