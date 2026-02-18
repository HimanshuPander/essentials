public with sharing class VariableExamples {

    public VariableExamples() {

    }

    public static void displayMessage() {
        String message = 'Welcome to SFDC Insights';
    
        System.debug(message);
        System.debug('User ID: ' + UserInfo.getUserId());
    
    }
}