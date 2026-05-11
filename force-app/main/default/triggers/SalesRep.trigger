trigger SalesRep on Account (before insert,before update) {
    
    for(account a:trigger.new){
        
       list<user> us = [select name from user where id=:a.OwnerId];
        for(user u:us){
        a.Sales_Rep__c =u.name;
            }}
    
    

}