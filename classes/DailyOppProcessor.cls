global class DailyOppProcessor implements Schedulable {
    global void execute(SchedulableContext cxt){
        List<Opportunity> oppList = [SELECT Id, LeadSource FROM Opportunity WHERE LeadSource = null LIMIT 200];
        
        for(Opportunity opp : oppList){
            opp.LeadSource = 'Web';
        }
        
        if(!oppList.isEmpty()){
            update oppList;
        }
    }
}