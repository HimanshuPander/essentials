public class CarAccessoryTriggerHandler{
    public static void afterInsert(List<Car_Accessory__c> carAccessoryList){
        Set<Id> carsIds = new Set<Id>();
        List<Car__c> carListToBeUpdated = new List<Car__c>();
        
        for(Car_Accessory__c carAccessory : carAccessoryList){
            if(carAccessory.CarId__c != null){
                carsIds.add(carAccessory.CarId__c);
            }
        }
        
        carListToBeUpdated = CarServiceTriggerHandler.calculateTotalAmount(carsIds);
        
        if(!carListToBeUpdated.isEmpty()){
            update carListToBeUpdated;
        }
    }
    
    public static void afterUpdate(List<Car_Accessory__c> carAccessoryList, Map<Id,Car_Accessory__c> oldMap){
        Set<Id> carsIds = new Set<Id>();
        List<Car__c> carListToBeUpdated = new List<Car__c>();
        
        for(Car_Accessory__c carAccessory : carAccessoryList){
            if(carAccessory.CarId__c != null && oldMap != null){
                carsIds.add(carAccessory.CarId__c);
            }
        }
        
        carListToBeUpdated = CarServiceTriggerHandler.calculateTotalAmount(carsIds);
        
        if(!carListToBeUpdated.isEmpty()){
            update carListToBeUpdated;
        }

    }
    
    public static void afterDelete(List<Car_Accessory__c> oldList){
        Set<Id> carsIds = new Set<Id>();
        List<Car__c> carListToBeUpdated = new List<Car__c>();
        
        for(Car_Accessory__c carAccessory : oldList){
            if(carAccessory.CarId__c != null){
                carsIds.add(carAccessory.CarId__c);
            }
        }
        
        carListToBeUpdated = CarServiceTriggerHandler.calculateTotalAmount(carsIds);
        
        if(!carListToBeUpdated.isEmpty()){
            update carListToBeUpdated;
        }

    }
}