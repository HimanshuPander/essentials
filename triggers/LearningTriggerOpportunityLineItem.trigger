trigger LearningTriggerOpportunityLineItem on OpportunityLineItem (after insert) {
    if(Trigger.isAfter){
        if(Trigger.isInsert){
            OpportunityLineItemTriggerHandler.createAssetRelatedToAcc(Trigger.new);
        }
    }
}