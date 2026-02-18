global class RemindOppOwners implements Schedulable {
    global void execute(SchedulableContext cxt){
        List<Opportunity> oppList = new List<Opportunity>();
        
        oppList = [SELECT Id, Name FROM Opportunity WHERE isClosed = False AND CloseDate < TODAY];
        
        TaskUtils.remindOwners(oppList);
    }
}