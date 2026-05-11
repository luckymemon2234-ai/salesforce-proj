public with sharing class lwcContact {
    @AuraEnabled(cacheable=true)
   public static List<OpportunityContactRole> displayAccounts(string recId){
       return [select Id,Contact.Name,Contact.Phone,IsPrimary From OpportunityContactRole Where opportunityId =: recId ];
   }
   @AuraEnabled
   public static List<OpportunityContactRole> updateRecord(String conId){
       System.debug('AccountId'+conId);
       OpportunityContactRole acc=[select Id,Contact.Name,isPrimary,opportunityId from OpportunityContactRole where Id=:conId];
       acc.isPrimary=true;
       String rec = acc.opportunityId;
    
       acc.isPrimary=true;
       try{
           update acc;
       }
      
	   catch (Exception e) {
           System.debug('unable to update the record due to'+e.getMessage());
       }
       return displayAccounts(rec);
   }
}