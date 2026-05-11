trigger opportunityQuote on Opportunity (before insert,before update) {
    
     Map<Id,Opportunity> nMap = new Map<Id,Opportunity>();
    nMap = trigger.newMap;
 list <quote>qlist = [select id,BillingAddress,(select Id from QuoteLineItems) from quote where opportunityID  in :nMap.keySet()];
    list<contact>cList= [select name from contact where accountId  in :nMap.keySet() limit 1 ];
     List<OpportunityContactRole>ocr = new List<OpportunityContactRole>(); 
    list<opportunity>openList= [select name from opportunity where isclosed = false ];
    list<OpportunityContactRole>opi = [select id,Open_Oppties__c,Role  from OpportunityContactRole where OpportunityId in :nMap.keySet() and isPrimary =true ];
    list<OpportunityContactRole>op =new list<OpportunityContactRole>();
    list<opportunity>wonList= [select name from opportunity where stageName='closed won' ];
    list<opportunity>lostList= [select name from opportunity where stageName='closed lost' ];
    
   AggregateResult ar1 = [select sum(amount)aver from opportunity];
    
    for(OpportunityContactRole o:opi){
        o.Open_Oppties__c = openList.size();
        o.Role = 'Influencer';
        o.closed_lost__c = lostList.size();
        o.closed_won__c = wonList.size();
         
         
        o.sumOppties__c = (decimal)ar1.get('aver');
        op.add(o);
    }
    update op;
    
    for(Opportunity op:trigger.new){
        if(op.StageName == 'Closed won' ){
          
            list<QuoteLineItem>qli  = new list <QuoteLineItem>();
            
                    
                if(qlist.size() !=0){
                for(quote qq:qlist){
                   qli = qq.QuoteLineItems;
               
                
                    if( qq.BillingAddress == NULL && qli.isEmpty() == true){
                op.addError('quote is empty');
                }
                else  {
                    OpportunityContactRole oc = new OpportunityContactRole();
                    for(Contact cx :cList){
                        oc.ContactId = cx.Id ;
                        oc.OpportunityId = op.Id;
                    }
                    ocr.add(oc);}
                    
                }
        }
        }}
    insert ocr;
        // Adding Opportunity primary contact to the Contact Role.

    List<OpportunityContactRole> OCRlist = new List<OpportunityContactRole>();
     list<OpportunityContactRole>opis = [select id,Open_Oppties__c,Role  from OpportunityContactRole where OpportunityId in :nMap.keySet()];

    for(Opportunity o:trigger.new){
OpportunityContactRole ocr = new OpportunityContactRole();
        if(o.PrimaryContact__c!=null  && opis.size() ==0 ){
            ocr.OpportunityId=o.Id;
            ocr.ContactId=o.PrimaryContact__c;
            ocr.Role='Assistant Manager';
            ocr.IsPrimary=True;
            OCRlist.add(ocr);
        }
    }
   insert OCRlist;


}