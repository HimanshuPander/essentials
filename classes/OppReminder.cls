public class OppReminder implements Schedulable {
    public void execute(SchedulableContext sc){
        List<Opportunity> oppList = new List<Opportunity>();
        oppList = [SELECT Id , StageName, CloseDate, OwnerId FROM Opportunity WHERE IsClosed = false AND CloseDate < TODAY];
        
        List<Task> taskList = new List<Task>();
        
        if(!oppList.isEmpty()){
            for(Opportunity opp : oppList){
                Task task = new Task();
                task.Subject = 'Reminder Task';
                task.Status = 'Open';
                task.Priority = 'Normal';
                task.WhatId = opp.Id;
                task.OwnerId = opp.OwnerId;
                taskList.add(task);
            }
        }
        
        if(!taskList.isEmpty()){
            insert taskList;
        }
    }
}