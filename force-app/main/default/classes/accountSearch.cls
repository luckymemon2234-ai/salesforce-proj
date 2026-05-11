public class accountSearch {
    
@auraEnabled

    public static List <Account> searchAccounts() {

        return [SELECT Id,Name,Type,accountnumber,BillingCity,BillingCountry,BillingState,Rating FROM Account LIMIT 30]; 

    }
    @auraEnabled
    public  static List <Account> searchAccountsFilter(string name,string Type, string BillingCity ,string  Rating,string  BillingCountry , string BillingState
 ) {
        String names ='%'+ name + '%'; 
      String types ='%' + Type + '%';    
     String BillingCi ='%' + BillingCity + '%';   
     String Ratings ='%' +  Rating + '%';           
     String BillingCountries ='%' +  BillingCountry + '%' ;           
      String BillingStates ='%' + BillingState + '%';
              
      
          String query = 'select Id,Name,Type,accountnumber,BillingCity,BillingCountry,BillingState,Rating from account';
     String query1;
     String query2;
     String query3;
      String query4;
     String query5;
     String query6;
     query = query + ' WHERE';
    integer querLen = query.length();
    
       system.debug(query.length());
     
   
           query1 = ' name LIKE :names';
           query2 = ' type LIKE :types';
           query3 = ' rating like :Ratings';
           query4 = ' BillingCountry LIKE :BillingCountries';
           query5 = ' BillingCity LIKE :BillingCi';
           query6 = ' BillingState like :BillingStates';
     if(String.isNotBlank(name)){
        
         query = query  + query1;
     }
     if(String.isNotBlank(type)){
         if(query.length()==querLen){
             query = query  +  query2;
         }
         else {
             query = query + ' AND ' + query2;
            querLen +=query.length();
         }
     }
     if(String.isNotBlank(Rating)){
         if(query.length()==querLen){
             query = query  +  query3;
         }
         else {
             query = query + ' AND ' + query3;
             querLen +=query.length();
         }
     }
     if(String.isNotBlank(BillingCountry)){
         if(query.length()==querLen){
             query = query  +  query4;
         }
         else {
             query = query + ' AND ' + query4;
            querLen +=query.length();
         }
     }
     if(String.isNotBlank(BillingCity)){
         if(query.length()==querLen){
             query = query  +  query5;
         }
         else {
             query = query + ' AND ' + query5;
             querLen +=query.length();
         }
     }
     if(String.isNotBlank(BillingState)){
         if(query.length()==querLen){
             query = query  +  query6;
         }
         else {
             query = query + ' AND ' + query6;
             querLen +=query.length();
         }
     }
    
         
            
      List<account> accList = Database.query(query);
    return accList;
   
      

    
 }
     @AuraEnabled
    public static Map<String, String> getType(){
        Map<String, String> options = new Map<String, String>();
       
        Schema.DescribeFieldResult fieldResult = Account.Type.getDescribe();
       
        List<Schema.PicklistEntry> pList = fieldResult.getPicklistValues();
        for (Schema.PicklistEntry p: pList) {
             options.put(p.getValue(), p.getLabel());
        }
        return options;
    }
         @AuraEnabled
    public static Map<String, String> getRating(){
        Map<String, String> options = new Map<String, String>();
       
        Schema.DescribeFieldResult fieldResult = Account.Rating.getDescribe();
       
        List<Schema.PicklistEntry> pList = fieldResult.getPicklistValues();
        for (Schema.PicklistEntry p: pList) {
             options.put(p.getValue(), p.getLabel());
        }
        return options;
    }
     @AuraEnabled
    public static List<contact> getContacts(list<id> i){
        list<contact>clist = [select Lastname,email,Phone,AccountId from contact where accountId =:i ];
        return clist;
    }


}