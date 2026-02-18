public class InsertSameContact implements Queueable {
	private Contact con;
    private String industryValue;
    
    public InsertSameContact(Contact con, String industryValue){
        this.con = con;
        this.industryValue = industryValue;
    }
    
    public void execute(QueueableContext qc){
        List<Account> accList = new List<Account>();
        accList = [SELECT Id FROM Account WHERE Industry =: industryValue];
        
        List<Contact> conList = new List<Contact>();
        
        for(Account acc : accList){
            Contact c = con.clone(false, false, false, false);
            c.AccountId = acc.Id;
     		conList.add(c);     
        }
        
        if(!conList.isEmpty()){
            insert conList;
        }
    }
}