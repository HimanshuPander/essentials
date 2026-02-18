public class AccountTriggerHandler {
    public static void createRelatedContact(List<Account> accList){
        List<Contact> conList = new List<Contact>();
        
        for(Account acc : accList){
            Contact con = new Contact();
            con.LastName = acc.Name;
            con.AccountId = acc.Id;
            conList.add(con);
        }
        
        if(!conList.isEmpty()){
            insert conList;
        }
    }
    
    public static void updateRating(List<Account> accList){
        for(Account acc : accList){
            if(acc.Industry != null && acc.Industry == 'Media'){
                acc.Rating = 'Hot';
            }
        }
    }
    
    public static void createRelatedOpportunity(List<Account> accList){
        List<Opportunity> oppList = new List<Opportunity>();
        for(Account acc : accList){
            Opportunity opp = new Opportunity();
            opp.Name = acc.Name;
            opp.StageName = 'Prospecting';
            opp.CloseDate = Date.today();
            opp.AccountId = acc.Id;
            oppList.add(opp);
        }
        
        if(!oppList.isEmpty()){
            insert oppList;
        }
    }
}