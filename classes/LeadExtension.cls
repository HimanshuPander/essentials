public class LeadExtension {
    public List<Lead> lList{get;set;}
    
    public LeadExtension(ApexPages.StandardController sc){
        lList = [Select name, Status from Lead order by Name];
    }
}