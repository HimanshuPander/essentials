public class SampleClass1 {
    public static void myMethod(){
        List<List<Integer>> intList = new List<List<Integer>>{
            new List<Integer>{1,4,7},
            new List<Integer>{2,5,8},
            new List<Integer>{3,6,9}
        };
        
        System.debug(intList);
    }
}