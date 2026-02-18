trigger LearningTriggerTask on Task (before delete) {
    if(Trigger.isBefore){
        if(Trigger.isDelete){
            TaskTriggerHandler.preventTaskDeletion(Trigger.old);
        }
    }
}