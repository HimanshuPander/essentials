public class DataTypeDemo {
    public void methodDemo(){
    	List<Account> accList = new List<Account>();
        Set<Id> idSet = new Set<Id>();
        Map<Id,Account> idToAccountMap = new Map<Id,Account>([Select Id,Name from Account Limit 2]);
        accList = [SELECT Id,Name FROM Account LIMIT 2];
        
        //System.debug('Acc List => ' + accList);
        if(!accList.isEmpty()){
        	for(Account acc : accList){
            	idSet.add(acc.Id);
        	}    
        }
        
        
        if(!idSet.isEmpty()){
            for(Id i : idSet){
                if(idToAccountMap.containsKey(i)){
                    System.debug('Map Value => ' + idToAccountMap.get(i));
                }
                //System.debug('i => ' + i);
            }
        }
    }
}