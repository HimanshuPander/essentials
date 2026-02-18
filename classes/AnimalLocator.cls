public class AnimalLocator {
    public static String getAnimalNameById(Integer i){
        String animalName;
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + i);
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        
        //If the request is successful, parse the Json response.
        
        if(response.getStatusCode() == 200){
            //Deserializes the JSON String into collection of primitive data types.
            
            Map<String,Object> result = (Map<String,Object>) JSON.deserializeUntyped(response.getBody());
            Map<String,Object> animalInfo = (Map<String,Object>) result.get('animal');
            animalName = (String) animalInfo.get('name');
            System.debug(animalName);
        }        
     return animalName;
    }
}