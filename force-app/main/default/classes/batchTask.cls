public class batchTask  implements Database.Batchable<sObject>{
   
    public Database.QueryLocator start (Database.BatchableContext bc){
        return Database.getQueryLocator([select id,status from case where status='escalated' ]);
    }
    
    public void execute (Database.BatchableContext bc, list<case>opps){
        list<task>adc = new list<task>();
        for(case op:opps){
           task ad = new task();
            ad.whatId = op.Id;
            ad.subject ='test task';
            ad.status = 'open';
          
            adc.add(ad);
        }
         insert adc;
    }
   
    public void finish(Database.BatchableContext bc){
        system.debug('recordprocessed');
    }



}