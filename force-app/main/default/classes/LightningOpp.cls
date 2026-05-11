public with sharing class LightningOpp {
    @AuraEnabled
    public static List<Account> opptyfetch(string recId) {
        //Parent(Account) to child(Contact 7 oppurtunity) SOQL Query
        List<Account> accList = [Select Id, (Select id,Name from Contacts),(Select id,Name From Opportunities) From Account Where Id =: recId];

        //Null Check
        if(!accList.isempty()){
        return accList;
        }
        return null;
}
@AuraEnabled
public static List<Opportunity> accfetch(string recId) {
    //Parent(Account) to child(Contact 7 oppurtunity) SOQL Query
    List<Opportunity> opptList = [Select Id, Account.name  From Opportunity Where Id =: recId];

    //Null Check
    if(!opptList.isempty()){
    return opptList;
    }
    return null;
}
@AuraEnabled 
public static List<account> accAcount(String recId){
    list<opportunity>opp = [select name,account.id from opportunity where id=:recId ];
    list<string>stl = new list<string>();
    for(opportunity o:opp){
        stl.add(o.account.id);
    }
    // for(String s:Stl){
    //     system.debug(s);
    // }
    list<account>acc = [select name from account where id=:stl];
    // for(Account a:acc){
    //     system.debug(a.name);
    // }
    return acc;
}
@AuraEnabled 
public static List<contact> conAcount(String recId){
    list<opportunity>opp = [select name,account.id from opportunity where id=:recId ];
    list<string>stl = new list<string>();
    for(opportunity o:opp){
        stl.add(o.account.id);
    }
    // for(String s:Stl){
    //     system.debug(s);
    // }
    list<account>acc = [select id,name from account where id=:stl];
    //list<string>acl  =new list <string>();
   // for(account a:acc){
     //   acl.add(a.account.id)
  //  }
    // for(Account a:acc){
    //     system.debug(a.name);
    // }
    list<contact>cList = [SELECT Id, Name FROM Contact where Account.Id =:stl];
    
     for(Contact a:cList){
        system.debug(a.name); }return cList;
}
}