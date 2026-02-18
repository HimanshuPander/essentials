public class SOQL1 {
    public static void myMethod(){
        List<Account> accList = [Select Name, NumberOfEmployees from Account];
        
        //For Loop
        
        for(Integer i = 0; i < accList.size(); i++){
            System.debug(accList[i].Name + ' ' + accList[i].NumberOfEmployees);
        }
        
        //For Each Loop
        
        for(Account a : accList){
            System.debug('***** Account Name : ' + a.Name + '***** NumberOfEmployees : ' + a.NumberOfEmployees);
        }
    }
}