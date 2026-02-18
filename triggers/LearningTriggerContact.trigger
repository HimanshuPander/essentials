trigger LearningTriggerContact on Contact (before insert) {
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            ContactTriggerHandler.populateEmailOnDptCheck(Trigger.new);
        }
    }
}