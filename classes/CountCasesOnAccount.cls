public class CountCasesOnAccount {
	@future
    public static void countCases(List<Id> accIds){
        List<Account> accList = [SELECT Id, Total_Phone_Cases__c, Total_Web_Cases__c, Total_Email_Cases__c, 
                                 (SELECT Id, Origin FROM Cases) FROM Account WHERE Id IN : accIds];
		               
        for(Account acc : accList){
            Integer Phone = 0, Web = 0, Email = 0;
           
            for(Case c : acc.Cases){
                if(c.Origin == 'Phone'){
                    Phone++;
                }else if(c.Origin == 'Web'){
                    Web++;
                }else if(c.Origin == 'Email'){
                    Email++;
                }
            }
             acc.Total_Phone_Cases__c = Phone;
             acc.Total_Web_Cases__c = Web;
             acc.Total_Email_Cases__c = Email;
        }
        
        if(!accList.isEmpty()){
            update accList;
        }
        
    }
}