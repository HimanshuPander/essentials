public class DMLclass9 {
    public static void myMethod(){
        //Undelete the lead records which got deleted today
        
        
        List<Lead> deletedRecords = [Select Name from Lead where isDeleted = true And LastModifiedDate = Today All rows];
        
        undelete deletedRecords;
    }
}