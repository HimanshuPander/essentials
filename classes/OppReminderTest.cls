@isTest
public class OppReminderTest {
	@isTest
    private static void testSchedulableClass(){
        List<Opportunity> oppList = new List<Opportunity>();
        
        for(Integer i = 0; i < 5; i++){
            oppList.add(new Opportunity(Name = 'Test Opportunity ' + i, StageName = 'Prospecting', CloseDate = Date.today().addDays(-7)));
        }
        
        insert oppList;
        
        Set<Id> oppIds = new Set<Id>();
        
        for(Opportunity opp : oppList){
            oppIds.add(opp.Id);
        }
        
        Test.startTest();
        OppReminder oppReminder = new OppReminder();
        String cronExp = '20 30 5 20 9 ? 2022';
        Id jobId = System.schedule('Opportunity Reminder', cronExp, oppReminder);
        Test.stopTest();
        
        List<Task> taskList = [SELECT Id FROM Task WHERE WhatId IN : oppIds];
        
        System.assertEquals(5, taskList.size());
    }
}