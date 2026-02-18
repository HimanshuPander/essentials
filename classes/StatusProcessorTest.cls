@isTest
public class StatusProcessorTest {
	@isTest
    private static void testStatusProcessorClass(){
        List<Car__c> carsList = new List<Car__c>();
        List<Car_Service__c> carServiceList = new List<Car_Service__c>();
        List<Car_Accessory__c> carAccessoryList = new List<Car_Accessory__c>();
        
        for(Integer i = 0; i < 100; i++){
            Car__c car = new Car__c();
            car.RegistrationId__c = 'RJ 31 CB ' + i;
            car.Status__c = 'Sold';
            carsList.add(car);
        }
        
        insert carsList;
        
        for(Car__c car : carsList){
                Car_Service__c carService = new Car_Service__c();
                carService.CarId__c = car.Id;
                carServiceList.add(carService);
                
                Car_Accessory__c carAccessory = new Car_Accessory__c();
                carAccessory.CarId__c = car.Id;
                carAccessoryList.add(carAccessory);
        }
        
        Test.startTest();
        insert carServiceList;
        insert carAccessoryList;
        StatusProcessor statusJob = new StatusProcessor();
        Id batchId = Database.executeBatch(statusJob);
        Test.stopTest();
        
        List<Car_Service__c> carServiceListUpdated = [SELECT Id FROM Car_Service__c WHERE Status__c = 'Sold'];
        List<Car_Accessory__c> carAccessoryListUpdated = [SELECT Id FROM Car_Accessory__c WHERE Status__c = 'Sold'];
        
        System.assertEquals(100, carServiceListUpdated.size());
        System.assertEquals(100, carAccessoryListUpdated.size());
    }
}