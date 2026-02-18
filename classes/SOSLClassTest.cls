public class SOSLClassTest {
    public static void myMethod(){
		String soslFindClause = 'Wingo OR SFDC';
        List<List<sObject>> searchList = [Find :soslFindClause IN ALL FIELDS Returning Account(Name),Contact(FirstName,LastName,Department)];
        
        List<Account> searchAccounts = (Account[])searchList[0];
        List<Contact> searchContacts = (Contact[])searchList[1];
        
        System.debug('Found the following Accounts :');
        for(Account a : searchAccounts){
            System.debug(a.Name);
        }
        
        System.debug('Found the following Contacts :');
        for(Contact c : searchContacts){
            System.debug(c.Firstname + ', ' + c.LastName + ', ' + c.Department);
        }
    }
}