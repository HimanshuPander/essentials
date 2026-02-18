public class MyControllerExtension {
    private final Account acct;
    
    //The Extension constructor initializes the private member variable acct by using the getRecord method from the standard Controller.
    
    public MyControllerExtension(ApexPages.StandardController s){
        acct = (Account)s.getRecord();
    }
    
    public String getGreeting(){
        return 'Hello ' + acct.Name + '(' + acct.Id + ')';
    }
}