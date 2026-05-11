public class countContactHelper {
public static void countContacts(List<Contact> newList, List<Contact> oldList){
        Set<Id> accountIds = new Set<Id>();       
        if(newList!=null){
        for(Contact c:newList){
            if(c.AccountId != null){
                accountIds.add(c.AccountId);
            }
        }}       
        if(oldList!=null){
          for(Contact c:oldList){
            if(c.AccountId != null){
                accountIds.add(c.AccountId);
            }
        }            
        }

        List<Account> accList = [Select Id, count__c,(Select Id from Contacts) from Account where Id in :accountIds];

        if(!accList.isEmpty()){
            for(Account acc:accList){
                acc.count__c = acc.Contacts.size();
            }
        }
        update accList;
    }
}