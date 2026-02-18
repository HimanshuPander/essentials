public class CarServiceTriggerHandler {
    public static void afterInsert(List<Car_Service__c> carServiceList){
        Set<Id> carsIds = new Set<Id>();
        List<Car__c> carListToBeUpdated = new List<Car__c>();
        
        for(Car_Service__c carService : carServiceList){
            if(carService.CarId__c != null){
                carsIds.add(carService.CarId__c);
            }
        }
        
        carListToBeUpdated = calculateTotalAmount(carsIds);
        
        if(!carListToBeUpdated.isEmpty()){
            update carListToBeUpdated;
        }
    }
    
    public static void  afterUpdate(List<Car_Service__c> carServiceList, Map<Id,Car_Service__c> oldMap){
         Set<Id> carsIds = new Set<Id>();
        List<Car__c> carListToBeUpdated = new List<Car__c>();
        
        for(Car_Service__c carService : carServiceList){
            if(carService.CarId__c != null && oldMap != null){
                carsIds.add(carService.CarId__c);
            }
        }
        
        carListToBeUpdated = calculateTotalAmount(carsIds);
        
        if(!carListToBeUpdated.isEmpty()){
            update carListToBeUpdated;
        }
    }
    
    public static void afterDelete(List<Car_Service__c> oldList){
         Set<Id> carsIds = new Set<Id>();
        List<Car__c> carListToBeUpdated = new List<Car__c>();
        
        for(Car_Service__c carService : oldList){
            if(carService.CarId__c != null){
                carsIds.add(carService.CarId__c);
            }
        }
        
        carListToBeUpdated = calculateTotalAmount(carsIds);
        
        if(!carListToBeUpdated.isEmpty()){
            update carListToBeUpdated;
        }
    }
    
    public static List<Car__c> calculateTotalAmount(Set<Id> carsIds){
        List<Car__c> carListToBeUpdated = new List<Car__c>();
        Map<Id,Decimal> carIdToTotalServiceAmountMap = new Map<Id,Decimal>();
        Map<Id,Decimal> carIdToTotalAccessoryAmountMap = new Map<Id,Decimal>();
        Map<Id,Car__c> carIdToCarMap;
        
        carIdToCarMap = new Map<Id,Car__c>([SELECT Id, Total_Expense__c FROM Car__c WHERE Id IN : carsIds]);
        
        for(Car_Service__c cs : [SELECT Id, CarId__c, Car_Service_Amount__c FROM Car_Service__c WHERE CarId__c IN : carsIds]){
            Decimal total = 0;
            if(carIdToTotalServiceAmountMap.containsKey(cs.CarId__c)){
                total = carIdToTotalServiceAmountMap.get(cs.CarId__c);
            }
            if(cs.Car_Service_Amount__c != null){
            	total = total + cs.Car_Service_Amount__c;    
            }
            carIdToTotalServiceAmountMap.put(cs.CarId__c, total);
        }
        
        for(Car_Accessory__c ca : [SELECT Id, CarId__c, Car_Accessory_Amount__c FROM Car_Accessory__c WHERE CarId__c IN : carsIds]){
            Decimal total = 0;
            if(carIdToTotalAccessoryAmountMap.containsKey(ca.CarId__c)){
                total = carIdToTotalAccessoryAmountMap.get(ca.CarId__c);
            }
            if(ca.Car_Accessory_Amount__c != null){
            	total = total + ca.Car_Accessory_Amount__c;    
            }
            carIdToTotalAccessoryAmountMap.put(ca.CarId__c, total);
        }
        
        if(carIdToTotalServiceAmountMap != null || carIdToTotalAccessoryAmountMap != null){
            for(Id carId : carIdToTotalServiceAmountMap.keySet()){
                Car__c car = new Car__c();
                car.Id = carId;
                car.Total_Expense__c = carIdToTotalServiceAmountMap.get(carId);
                if(carIdToTotalAccessoryAmountMap.get(carId) != null){
                    car.Total_Expense__c = carIdToTotalServiceAmountMap.get(carId) + carIdToTotalAccessoryAmountMap.get(carId);
                }
                carListToBeUpdated.add(car);
            }
        }
        
        return carListToBeUpdated;
    }
}