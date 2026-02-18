@isTest
public class testTaskPriority {
    @isTest static void testTaskPriority(){
        String pri = TaskUtil.getTaskPriority('NY');
        System.assertEquals('Normal', pri);
    } 
    @isTest static void testTaskHighPriority(){
        String pri = TaskUtil.getTaskPriority('CA');
        System.assertEquals('High', pri);
    }
    @isTest static void testTaskPriorityInvalid(){
        String pri = TaskUtil.getTaskPriority('Bordana');
        System.assertEquals(null, pri);
    }
}