trigger LearningTriggerCase on Case (before insert) {
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            CaseTriggerHandler.updateCaseStatus(Trigger.new);
        }
    }
}