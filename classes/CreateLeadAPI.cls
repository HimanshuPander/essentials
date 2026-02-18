@RESTResource(urlMapping='/CreateLead/')
global class CreateLeadAPI{
    
   	@HTTPPost
    global static String doPost(){
        
        String fName, lName, comp, fieldName, fieldValue;
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        
        String jsonBody = req.requestBody.toString();
        
        JSONParser parser = JSON.createParser(jsonBody);
        while(parser.nextToken() != null){
            if(parser.getCurrentToken() != JSONToken.END_OBJECT){
                fieldName = parser.getCurrentName();
                fieldValue = parser.getText();
                
                if(fieldName == 'FirstName'){
                    fName = fieldValue;
                }else if(fieldName == 'LastName'){
                    lName = fieldValue;
                }else if(fieldName == 'Company'){
                    comp = fieldValue;
                }
            }
        }
        
        Lead l = new Lead(FirstName =  fName, LastName = lName, Company = comp);
        insert l;
        System.debug('Body is : ' + jsonBody);
    
    return l.Id;
    } 
}