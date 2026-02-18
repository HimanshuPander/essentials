@isTest
public class ContactTriggerHandlerTest {
	@isTest
    private static void populateEmailOnDptCheckTest(){
        List<Contact> conList = new List<Contact>();
        
        for(Integer i = 1; i <= 5; i++){
            Contact con = new Contact();
            con.LastName = 'Test ' + i;
            con.Department = 'CSE';
            conList.add(con);
        }
        
        insert conList;
        
        List<Contact> conListUpdated = [SELECT Id, Email FROM Contact];
        System.assertEquals('sfdc@gmail.com',conListUpdated[0].Email);
    }
}