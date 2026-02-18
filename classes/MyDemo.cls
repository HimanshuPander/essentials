public class MyDemo {
    public static void updateContacts(){
        
        List<Account> accList = [SELECT Id, Phone FROM Account WHERE CreatedDate = LAST_YEAR AND Phone != NULL];
        Map<Id,Account> idToAccMap = new Map<Id,Account>(accList);
        
       // for(Account acc : accList){
       //     idToAccMap.put(acc.Id, acc);
       // }
        
        List<Contact> conList = [SELECT Id, AccountId, Phone FROM Contact WHERE AccountId IN : idToAccMap.keySet()];
        List<Contact> contactsToBeUpdated = new List<Contact>();
        
        if(!conList.isEmpty()){
            for(Contact con : conList){
                if(idToAccMap.containsKey(con.AccountId)){
                    Contact conRec = new Contact();
                    conRec.Id = con.Id;
                	conRec.Phone = idToAccMap.get(con.AccountId).Phone; 
                    contactsToBeUpdated.add(conRec);
                }  
            }
        }
        
        if(!contactsToBeUpdated.isEmpty()){
            update contactsToBeUpdated;
        }
   
    }
}