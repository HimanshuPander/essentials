public class DMCclass10 {
    public static void myMethod(){
        //Merge
        
        //Merge Combinations
        //sObject with sObject
        //sObject with List<sObject>
        //sObject with ID
        //sObject with List<ID>
        
        List<Account> accList = [Select Name from Account where Name like 'Merge%' order by name limit 3];
        Account a = accList[0];
        Account b = accList[1];
        Account c = accList[2];
        
        List<Account> mergeList = new List<Account>();
        mergeList.add(accList[1]);
        mergeList.add(accList[2]);
        
        //merge a b;		//For 2 Records
        merge a mergeList;	//For 3 Records
        //merge a c.id;		//With ID
        
    }
}