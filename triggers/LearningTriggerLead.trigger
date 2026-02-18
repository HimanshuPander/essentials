trigger LearningTriggerLead on Lead (before insert) {
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            LeadTriggerHandler.updateRating(Trigger.new);
        }
    }
}