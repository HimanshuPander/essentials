public class TaskTriggerHandler {
    public static void preventTaskDeletion(List<Task> taskList){
        Id profileId = Userinfo.getProfileId();
        Profile profileIns = [SELECT Name FROM Profile WHERE Id =: profileId];
        
        for(Task t : taskList){
            if(profileIns.Name != 'System Administrator'){
                t.addError('You don\' have access to delete this task !');
            }
        }
    }
}