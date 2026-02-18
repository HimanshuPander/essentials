public with sharing class VariableDemo {

    public String instanceVariable = 'Instance Variable';

    public VariableDemo() {

    }

    public void displayVariables() {

        String localVariable = 'Local Variable';

        System.debug('Instance: ' + instanceVariable);

        System.debug('Local: ' + localVariable);

    }
}