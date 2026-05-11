public with sharing class opptySrch {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccount( String searchId)
{
    
    list<account>accList = new List<account>();
    for(account acc:[select id,name,phone from account where id =: searchId]){
        accList.add(acc);
    }
    return accList;
}
}