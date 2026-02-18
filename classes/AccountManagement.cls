@RESTResource(urlMapping='/AccountManagement/')
global class AccountManagement {
	
    @HTTPGet
    global static String showAccount(){
        Id i;
        
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        
        i = req.headers.get('Id');
        
        String qr = 'SELECT Name FROM Account WHERE Id =: ' + i;
        Account acc = Database.query(qr);
        
        String jsonResponse = '{\"Name\" :\"'+acc.Name+'\"}';
        return jsonResponse;
    }
    
    @HTTPPost
    global static String newAccount(){
        String name;
        Integer numberOfEmployees;
        String fieldName, fieldValue;
        
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        
        String jsonBody = req.requestBody.toString();
        
        JSONParser parser = JSON.createParser(jsonBody);
        
        while(parser.nextToken() != null){
            if(parser.getCurrentToken() != JSONToken.END_OBJECT){
                fieldName = parser.getCurrentName();
                fieldValue = parser.getText();
                
                if(fieldName == 'Name'){
                    name = fieldValue;
                }else if(fieldName == 'Number Of Employees'){
                    numberOfEmployees = Integer.valueOf(fieldValue);
                }
            }
        }
        
        Account acc = new Account(Name = name, NumberOfEmployees = numberOfEmployees);
        insert acc;
        
        return acc.Id;
    }
    
    @HTTPPatch
    global static String doAccountUpdate(){
        String rating;
        
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        
        String jsonBody = req.requestBody.toString();
        
        Id i = req.headers.get('Id');
        
        JSONParser parser = JSON.createParser(jsonBody);
        
        while(parser.nextToken() != null){
            if(parser.getCurrentToken() != JSONToken.END_OBJECT){
                String fieldName = parser.getCurrentName();
                String fieldValue = parser.getText();
                
                if(fieldName == 'Rating'){
                    rating = fieldValue;
                }
            }
        }
        
        String qr = 'SELECT Rating FROM Account WHERE Id =: i';
        Account a = Database.query(qr);
        a.Rating = rating;
        
        update a;
        
        return 'Field Value Updated Successfully';
    }
    
    @HTTPDelete
    global static String deleteRecord(){
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        
        Id i = req.headers.get('Id');
        String qr = 'SELECT Id FROM Account WHERE Id =: i';
        Account acc = Database.query(qr);
        
        delete acc;
        
        return 'Successfully Deleted';
    }
}