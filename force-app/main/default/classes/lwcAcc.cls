public with sharing class lwcAcc {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccount( String searchKey)
{
    string searchWord = '%' + searchKey + '%';
    list<account>accList = new List<account>();
    for(account acc:[select id,name,phone from account where name Like: searchWord ]){
        accList.add(acc);
    }
    return accList;
   
    }}