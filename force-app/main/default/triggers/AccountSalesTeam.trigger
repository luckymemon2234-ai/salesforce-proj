trigger AccountSalesTeam on Account (before insert, before update) {
  /*  for(Account acc : trigger.new){
        List<salesteam__C>slt = [select Name from SalesTeam__c where Account__c =: acc.id limit 1];
         List<Hardware_Team_Members__c> htm = [Select Name from Hardware_Team_Members__c where Hardware_Team_Member__c =:acc.id limit 1];
        for(SalesTeam__c s:slt){
        acc.SalesTeam__c  = s.Name;
        }
        for(Hardware_Team_Members__c h:htm){
            acc.Hardware_Team_Member__c = h.name;        }
        
    } */
     Map<Id,Account> nMap = new Map<Id,Account>();

    nMap = trigger.newMap;
      List<salesteam__C> cList = [select Name from SalesTeam__c where Account__c in :nMap.keySet()];
     List<Hardware_Team_Members__c> htm = [Select Name from Hardware_Team_Members__c where Hardware_Team_Member__c in :nMap.keySet()];
    for(account acc:trigger.new){
 for(SalesTeam__c s:cList){
        acc.SalesTeam__c  = s.Name;
        }
        for(Hardware_Team_Members__c h:htm){
            acc.Hardware_Team_Member__c = h.name;        }
        
    }
}