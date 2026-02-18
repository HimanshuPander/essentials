@isTest
public class CarAccessoryTriggerHandlerTest {
	@testSetup
    private static void testSetup(){
        List<Car__c> carsList = new List<Car__c>();
        List<Car_Service__c> carServiceList = new List<Car_Service__c>();
        List<Car_Accessory__c> carAccessoryList = new List<Car_Accessory__c>();
        
        for(Integer i = 0; i < 5; i++){
            Car__c car = new Car__c();
            car.RegistrationId__c = 'RJ 31 CB ' + i;
           	carsList.add(car);
        }
        
        if(!carsList.isEmpty()){
            insert carsList;
        }
        
        
        for(Car__c car : carsList){
            for(Integer i = 0; i < 2; i++){
                Car_Service__c carService = new Car_Service__c();
                carService.CarId__c = car.Id;
                carService.Name = 'Test ' + i;
                carService.Car_Service_Amount__c = 50;
                carServiceList.add(carService);
            }
            for(Integer i = 0; i < 2; i++){
                Car_Accessory__c carAccessory = new Car_Accessory__c();
                carAccessory.CarId__c = car.Id;
                carAccessory.Name = 'Test ' + i;
                carAccessory.Car_Accessory_Amount__c = 50;
                carAccessoryList.add(carAccessory);
            }
        }
        
        if(!carServiceList.isEmpty()){
            insert carServiceList;
        }
        if(!carAccessoryList.isEmpty()){
            insert carAccessoryList;
        }
    }
    
	@isTest
    private static void afterInsertTest(){        
        
        List<Car__c> carsList  = [SELECT Id, Total_Expense__c FROM Car__c LIMIT 1];
        
        System.assertEquals(200, carsList[0].Total_Expense__c);
        
    }
    
    @isTest
    private static void afterUpdateTest(){
        
        List<Car__c> carAndAccessoryList = [SELECT Id, (SELECT Id FROM Car_Accessories__r) FROM Car__c];
        List<Car_Accessory__c> carAccessoryList = new List<Car_Accessory__c>();
        
        for(Car__c car : carAndAccessoryList){
            for(Car_Accessory__c carAccessory : car.car_Accessories__r){
                Car_Accessory__c ca = new Car_Accessory__c();
                ca.Id = carAccessory.Id;
                ca.Car_Accessory_Amount__c = 20;
                carAccessoryList.add(ca);
            }
        }
        
        Test.startTest();
        update carAccessoryList;
        Test.stopTest();
        
        List<Car__c> carsList  = [SELECT Id, Total_Expense__c FROM Car__c LIMIT 1];
        
        System.assertEquals(140, carsList[0].Total_Expense__c);
    }
   
    @isTest
    private static void afterDeleteTest(){
        List<Car_Accessory__c> carAccessoryList = [SELECT Id, Name FROM Car_Accessory__c WHERE Name = 'Test 1'];
        
        Test.startTest();
        delete carAccessoryList;
        Test.stopTest();
        
        List<Car__c> carsList  = [SELECT Id, Total_Expense__c FROM Car__c LIMIT 1];
        
        System.assertEquals(150, carsList[0].Total_Expense__c);
    }
}