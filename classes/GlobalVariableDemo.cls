public with sharing class GlobalVariableDemo {
    public GlobalVariableDemo() {

    }

    public void showUserInfo() {

        System.debug('User Id: ' + UserInfo.getUserId());
        
    }
}