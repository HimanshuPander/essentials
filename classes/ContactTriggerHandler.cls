public class ContactTriggerHandler {
    public static void populateEmailOnDptCheck(List<Contact> conList){
        for(Contact con : conList){
            if(con.Department == 'CSE'){
                con.Email = 'sfdc@gmail.com';
            }
        }
    }
}