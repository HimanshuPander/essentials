public class LeadTriggerHandler {
    public static void updateRating(List<Lead> leadList){
        for(Lead l : leadList){
            if(l.LeadSource == 'Web'){
                l.Rating = 'Cold';
            }else{
                l.Rating = 'Hot';
            }
        }
    }
}