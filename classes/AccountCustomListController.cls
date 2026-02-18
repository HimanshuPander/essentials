public class AccountCustomListController {
    
    public List<Account> aList{get;set;}
    
    
    public AccountCustomListController(){
        aList = [Select Name, NumberOfEmployees from Account order by Name];
    }
}