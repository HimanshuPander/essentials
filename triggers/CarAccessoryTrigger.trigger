trigger CarAccessoryTrigger on Car_Accessory__c (after insert, after update, after delete) {
	if(Trigger.isAfter){
        if(Trigger.isInsert){
            CarAccessoryTriggerHandler.afterInsert(Trigger.new);
        }else if(Trigger.isUpdate){
            CarAccessoryTriggerHandler.afterUpdate(Trigger.new, Trigger.oldMap);
        }else if(Trigger.isDelete){
            CarAccessoryTriggerHandler.afterDelete(Trigger.old);
        }
    }
}