public class CurrencyConverterClass {
    public static void convertCurrency(Decimal usd){
        Decimal inr = 0.0;
        
        HTTP h = new HTTP();
        HTTPRequest req = new HTTPRequest();
        
        req.setEndpoint('https://api.freecurrencyapi.com/v1/latest?apikey=apCG36yPxkehAZXSsCOLbrPXtw01Lr3OJt3KGNyr');
        req.setMethod('GET');
        HTTPResponse res = h.send(req);
        
        Map<String,Object> jsonBody1 = (Map<String,Object>)JSON.deserializeUntyped(res.getBody());
        for(String s : jsonBody1.keySet()){
			Map<String,Object> jsonBody2 = (Map<String,Object>)JSONBody1.get(s);
            for(String s1 : jsonBody2.keySet()) {
                system.debug('String2 : '+s+' , value : '+s1);  
            }
        }
    }
}