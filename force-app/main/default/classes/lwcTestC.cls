public with sharing class lwcTestC {
    @AuraEnabled(cacheable = true)
    public static List<Account> Accfetch(string recId) {
        //Parent(Account) to child(Contact 7 oppurtunity) SOQL Query
        List<Account> accList = [Select Id, (Select id,Name from Contacts),(Select id,Name From Opportunities) From Account Where Id =: recId];

        //Null Check
        if(!accList.isempty()){
        return accList;
        }
        return null;
}



@AuraEnabled(cacheable = true)
public static List<Opportunity> opptyfetch(string recId) {
    //Parent(Account) to child(Contact 7 oppurtunity) SOQL Query
    List<Opportunity> accList = [Select Id,AccountId,Account.name,Name,ContactId,(Select contactId,contact.phone,contact.lastName FROM OpportunityContactRoles)   From Opportunity Where Id =: recId];

    //Null Check
  
    return accList;

 
}
@AuraEnabled(cacheable = true)
public static List<OpportunityContactRole> opptyContactfetch(string recId) {
    
    List<OpportunityContactRole> accList = [Select Id,Contact.Name,Contact.Phone,IsPrimary   From OpportunityContactRole Where opportunityId =: recId];

    //Null Check
  
    return accList;

 
}
}