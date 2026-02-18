public with sharing class VariableScopeExamples {

    public static String instanceVariable = 'Class Scope'; // Class scope

    public VariableScopeExamples() {

    }

    

    public static void showScope() {

        String localVariable = 'Local'; // Local scope

        System.debug(instanceVariable + ' ' + localVariable);

    }
}