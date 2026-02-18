public with sharing class DatatypeExamples {
    public DatatypeExamples() {
        System.debug('Data Type Examples!');
    }

    public static void integerExample() {
        Integer userCount = 150;
        System.debug('User Count: ' + userCount);
    }
    
    public static void decimalExample() {
        Decimal discount = 12.5;
        System.debug('Discount: ' + discount);
    }
    
    public static void stringExample() {
        String greeting = 'Welcome to SFDC Insights!';
        System.debug('Greeting: ' + greeting);
    }

    public static void dateTimeExample() {
        Date today = Date.today();
        DateTime now = DateTime.now();
        System.debug('Today: ' + today);
        System.debug('Current Time: ' + now);
    }
    
    public static void booleanExample() {
        Boolean isActive = true;
        System.debug('Is Active: ' + isActive);
    }

    public static void idExample() {
        Id recordId = '0012w00000J9IYr';
        System.debug('Record ID: ' + recordId);
    }

    //Collections Examples

    public static void listExample() {
        List<String> fruits = new List<String>{'Apple', 'Banana', 'Mango'};
        System.debug('Fruits List: ' + fruits);
    }

    public static void setExample() {
        Set<String> cities = new Set<String>{'London', 'Paris', 'Tokyo'};
        System.debug('Cities Set: ' + cities);
    }

    public static void mapExample() {
        Map<Integer, String> employeeMap = new Map<Integer, String>{
            101 => 'Alice',
            102 => 'Bob'
        };
        System.debug('Employee Map: ' + employeeMap);
    }

    public static void sObjectExample() {
        Account acc = new Account(Name = 'Test Account', Phone = '1234567890');
        insert acc;
        System.debug('Inserted Account ID: ' + acc.Id);
    }

    // Declare the enum within the class
    public enum Status {
        Open,
        InProgress,
        Closed
    }
    
    public static void enumExample() {
        // Assigning a value from the enum
        Status currentStatus = Status.Open;
        System.debug('Current Status: ' + currentStatus);
        
        // Changing the status
        currentStatus = Status.Closed;
        System.debug('Updated Status: ' + currentStatus);
    }

    
}