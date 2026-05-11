public with sharing class newsController {
    @AuraEnabled(Cacheable=true)
    public static Map<string,object> retriveNews(){
 
     Http http = new Http();
     HttpRequest httpRequest =  new HttpRequest();
     httpRequest.setEndpoint('https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=07033f0070244c868aa36f1d7e3db435');
     httpRequest.setMethod('GET');
     Map<string,Object> newJsonData = new Map<String,object>();
 
     string strResponse = null;
     try{
         HttpResponse httpResponse = http.send(httpRequest);
         if(httpResponse.getStatusCode()==200){
             strResponse = httpResponse.getBody();
             
         }
         else {
             throw new CalloutException(httpResponse.getBody());
         }
        
         }
         catch(Exception ex){
             throw ex;}
 if(!String.isBlank(strResponse)){
     newJsonData = (Map<String,Object>)JSON.deserializeUntyped(strResponse);
 }
 if(!newJsonData.isEmpty()){
     return newJsonData;
 }
 else {
     return null;
 }
     }
    }