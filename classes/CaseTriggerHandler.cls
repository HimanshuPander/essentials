public class CaseTriggerHandler {
    public static void updateCaseStatus(List<Case> caseList){
        for(Case cs : caseList){
            if(cs.Origin == 'Email'){
                cs.Status = 'New';
                cs.Priority = 'Medium';
            }
        }
    }
}