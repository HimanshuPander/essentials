trigger LearningTriggerOpportunity on Opportunity (after insert) {
    if(Trigger.isAfter){
        if(Trigger.isInsert){
            if(Recursive.lock){
                Recursive.lock = false;
                OpportunityTriggerHandler.calTotalAmountAndOpps(Trigger.new);
            }
        }
    }
}