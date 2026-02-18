public with sharing class StaticDemo {
    public StaticDemo() {

    }

    public static Integer staticCount = 0;

    public static void incrementCount() {

        staticCount++;
        System.debug('Value of staticCount > ' + staticCount);

    }
}