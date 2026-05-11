public class batchAddress implements Database.Batchable<sObject>{
   
    public Database.QueryLocator start (Database.BatchableContext bc){
        return Database.getQueryLocator([select id,billingCity,BillingCountry from account ]);
    }
    
    public void execute (Database.BatchableContext bc, list<account>opps){
        list<Address__c>adc = new list<Address__c>();
        for(account op:opps){
           Address__c ad = new Address__c();
            ad.Name = op.billingCity;
            ad.Address__City__s = op.billingCity;
          
            adc.add(ad);
        }
         insert adc;
    }
   
    public void finish(Database.BatchableContext bc){
        system.debug('recordprocessed');
    }



}