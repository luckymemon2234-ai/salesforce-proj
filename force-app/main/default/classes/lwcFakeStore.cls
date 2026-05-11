public with sharing class lwcFakeStore {
   @AuraEnabled
   public static string fake(){
    Http http = new Http();
    HttpRequest request = new HttpRequest();
    request.setMethod('GET');
    request.setEndpoint('https://api.escuelajs.co/api/v1/products');
    HttpResponse response = http.send(request);
    if(response.getStatusCode()==200){
        return response.getBody();
    }

    else {
        return '';
    }
  
   }
}