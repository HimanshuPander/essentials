public class SOQL2 {
    public static void myMethod(String str){
        //****** SOQL Variable Binding
       
        //Comparing Static Value
        
        List<Contact> conList = [Select firstName, lastName, Email from Contact where firstName = 'John'];
        
        //Comparing Value dynamically
        
        List<Contact> conList2 = [Select firstName, lastName, email from Contact where firstName = :str];
    }
}