trigger CarServiceTrigger on Car_Service__c (after insert, after update, after delete) {
    if(Trigger.isAfter){
        if(Trigger.isInsert){
            CarServiceTriggerHandler.afterInsert(Trigger.new);
        }else if(Trigger.isUpdate){
            CarServiceTriggerHandler.afterUpdate(Trigger.new, Trigger.oldMap);
        }else if(Trigger.isDelete){
            CarServiceTriggerHandler.afterDelete(Trigger.old);
        }
    }
}