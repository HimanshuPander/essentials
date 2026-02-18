public class ListClass 
{
	public static void myMethod()
    {
        List<Integer> numbers = new List<Integer>(4); 
        
        //Adding using Array Notation
        
        numbers[0] = 10;
        numbers[1] = 20;
        numbers[2] = 30;
        numbers[3] = 40;

        System.debug(numbers);
        System.debug(numbers.size());
        
        //****************Performing methods on List **************
        
        //Calculating the size of the List
        
      	System.debug(numbers.size());		//4
        
        //Getting a field value from the List
        
        System.debug(numbers.get(1));		//20
        
        //Removing an Item from the List in Apex
        
        numbers.remove(1);			//20 will be removed 
        
        System.debug(numbers);		//(10,30,40)
        
        List<Integer> numref = numbers.clone();		//Generating a copy of a List
        System.debug('Contents of List named as numref');
        System.debug(numref);		//(10,30,40)
        
        //Setting a new value in a List
        
        numref.set(0,20);			//Value 20 will be stored at index 0 in List numref and the existing value will be replaced
        numref.set(1,50);			//(20,50,40)
        System.debug('List after adding value by set method');
        System.debug(numref);
        
        //Sorting an List in Apex
        
        numref.sort();			//(20,40,50)
        System.debug('Values after Sorting the List named as numref');
        System.debug(numref);	//(20,40,50)
        
        //Checking if the list is empty
        
        System.debug(numref.isEmpty());		//False
        
        //Making an list empty
        
        numref.clear();		//List will be empty
        
        System.debug(numref.isEmpty());		//true
    }
}