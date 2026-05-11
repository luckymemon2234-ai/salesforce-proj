global class leadFuture {
@future
    public static void futureMethod(){
        

        list<lead>leadList = [select id from lead where status = 'closed converted'];
        list<opportunity>opp =new list <opportunity>();
                              
        for(lead s:leadList){
       opportunity opo = new opportunity();
            
            opo.Id = s.ConvertedOpportunityId;
           opo.Total_Opportunity_Amount__c =777;
               opp.add(opo);
           
            
        }
        update opp;
        
    }
}