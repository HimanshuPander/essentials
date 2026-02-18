public class StatusProcessor implements Database.Batchable<sObject>,Database.stateful{
    public integer totalServiceRecord = 0;
    public integer totalAccessoryRecord = 0;
    public Database.QueryLocator start(Database.BatchableContext bc){ 
        return Database.getQueryLocator([SELECT Id, Status__c FROM Car__c WHERE Status__c = 'Sold']);
    }
    
    public void execute(Database.BatchableContext bc, List<Car__c> carsList){
        Map<Id,Car__c> carIdToCarMap = new Map<Id,Car__c>(carsList);
        List<Car_Service__c> carServiceListToBeUpdated = new List<Car_Service__c>();
        List<Car_Accessory__c> carAccessoryListToBeUpdated = new List<Car_Accessory__c>();
        
        for(Car_Service__c carService : [SELECT Id, Status__c FROM Car_Service__c WHERE CarId__c IN : carIdToCarMap.keySet() AND Status__c = null]){
            Car_Service__c cs = new Car_Service__c();
            cs.Id = carService.Id;
            cs.Status__c = 'Sold';
            carServiceListToBeUpdated.add(cs);
        }
        
        for(Car_Accessory__c carAccessory : [SELECT Id, Status__c FROM Car_Accessory__c WHERE CarId__c IN : carIdToCarMap.keySet() AND Status__c = null]){
            Car_Accessory__c ca = new Car_Accessory__c();
            ca.Id = carAccessory.Id;
            ca.Status__c = 'Sold';
            carAccessoryListToBeUpdated.add(ca);
        }
        
        totalServiceRecord += carServiceListToBeUpdated.size();
        totalAccessoryRecord += carAccessoryListToBeUpdated.size();
        
        if(!carServiceListToBeUpdated.isEmpty()){
            update carServiceListToBeUpdated;
        }
        
        if(!carAccessoryListToBeUpdated.isEmpty()){
            update carAccessoryListToBeUpdated;
        }     
    }
    
    public void finish(Database.BatchableContext bc){
        System.debug('Total Records Processed : ' + totalServiceRecord);
        System.debug('Total Records Processed : ' + totalAccessoryRecord);
    }
}