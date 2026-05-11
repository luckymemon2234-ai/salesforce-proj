trigger leadAddress on Lead (after insert , after update) {
      List<lead> leadList = trigger.new;
    Set<ID> leadIds= new Set<ID>();

    List<Address__c>adc1 = new List<Address__c>();
     for(lead leadRecord : leadList) {
        if ( leadRecord.isConverted == true){
              Address__c add1 = new Address__c();
             leadIds.add(leadRecord.Id);
 
           add1.Name = 'fromLead' + leadRecord.LastName;
           add1.country__c=   leadRecord.Country  ;
           add1.Address__City__s = leadRecord.City;
            add1.Address__Street__s =leadRecord.Street;
      
           
            add1.Account__c = leadRecord.ConvertedAccountId;
            adc1.add(add1);
            system.debug(add1);
         
        }
        
         
     }
     insert adc1;
}