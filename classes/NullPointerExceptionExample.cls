public with sharing class NullPointerExceptionExample {
    public NullPointerExceptionExample() {

    }

    public static void showValue() {
        Integer count;
        count = count + 5;
        System.debug(count); // NullPointerException
    }
}