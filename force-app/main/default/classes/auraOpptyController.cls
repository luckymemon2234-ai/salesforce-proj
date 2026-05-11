public class auraOpptyController {
@AuraEnabled
    public static List<opportunity> getopportunity(id recordId) {
        List<opportunity> opportunitys = 
                [SELECT Id, Name,accountId,account.name FROM opportunity where id=:recordId ];

        
        return opportunitys;
    }
    @AuraEnabled
    public static List<OpportunityContactRole> opptyContactfetch(string recId) {
    
    List<OpportunityContactRole> accList = [Select Id,Contact.Name,Contact.Phone,IsPrimary  From OpportunityContactRole Where opportunityId =: recId];

   
  
    return accList;

 
}
}