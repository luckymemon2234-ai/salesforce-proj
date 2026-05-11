public class batchOpptyStage  implements Database.Batchable<sObject>{
   
    public Database.QueryLocator start (Database.BatchableContext bc){
        return Database.getQueryLocator([select id from opportunity where isClosed = false]);
    }
    
    public void execute (Database.BatchableContext bc, list<opportunity>opps){
        for(opportunity op:opps){
            op.stageName= 'prospect';
            
            
        }
         update opps;
    }
   
    public void finish(Database.BatchableContext bc){
        system.debug('recordprocessed');
    }



}