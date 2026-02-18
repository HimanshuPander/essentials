public class trailhead_basic {
	public static void myMethod(){
    //List<String> color = new List<String>();
    
    //String[] colors = new List<String>();
    
    //Create a list and add elements to it one step
    
    List<String> colors = new List<String> {'red', 'green', 'blue'};
    
    //Add elements to a list after it has been created
    
    List<String> moreColors = new List<String>();
    
    moreColors.add('orange');
    moreColors.add('purple');
        
    //Get elements from the List
    
    String color1 = moreColors.get(0);
    String color2 = moreColors[1];
        
    //System.assertEquals(color1, color2);
        
    //Iterate over a list to read elements
    
        for(Integer i = 0; i < colors.size(); i++){
            //Write value to the debug log
            System.debug(colors[i]);
        }
        
    }
}