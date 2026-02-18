public class AnimalsCallout {
    public static HttpResponse makeGetCallout(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        
        request.setEndPoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        
        //If the request is successful, parse the Json response
        if(response.getStatusCode() == 200){
            //Deserializes the Json string into collection to primitive data types.
            Map<String, Object> results = (Map<String, Object>) Json.deserializeUntyped(response.getBody());
            //Cast the values in 'animals' key as a list
            List<Object> animals = (List<Object>) results.get('animals');
            System.debug('Received the following animals:');
            for(Object animal : animals){
                System.debug(animal);
            }
        }
        return response;
    }
    
    public static HttpResponse makePostCallout(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody('{"name":"mighty-moose"}');
        
        HttpResponse response = http.send(request);
        
        //Parse the Json response
        
        if(response.getStatusCode() != 201){
            System.debug('The Status Code returned was not expected:' + response.getStatusCode() + ' ' + response.getStatus());
        }else{
            System.debug(response.getBody());
        }
        return response;
    }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
}