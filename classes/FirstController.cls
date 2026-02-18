public class FirstController {
   
    public String accName;
    public Integer accEmployees;
    
    public String conName, conEmail;
    
    public String oppName;
    public Decimal oppAmount;	
    
    public FirstController(){
        
    }
    
    public void saveTheRecord(){
        Account a = new Account(Name = accName, NumberOfEmployees = accEmployees);
        
        insert a;
        
        Contact c = new Contact(LastName = conName, email = conEmail, accountId = a.Id);
        
        Opportunity o = new Opportunity(Name = oppName, Amount = oppAmount, accountId = a.Id);
        
        insert c;
        insert o;
    }
    
    public void setAccName(String a){
        accName = a;
    }
    
    public String getAccName(){
        return accName;
    }
}