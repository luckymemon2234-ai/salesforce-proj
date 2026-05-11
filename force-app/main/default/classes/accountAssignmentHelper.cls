public class accountAssignmentHelper {
    public static void Main(List <account>accList){ 
        for(Account actNew:accList){
      	         
			actNew.ShippingCity = actNew.BillingCity; 
			actNew.ShippingCountry = actNew.BillingCountry;
			actNew.ShippingPostalCode = actNew.BillingPostalCode;
			actNew.ShippingState = actNew.BillingState;
			actNew.ShippingStreet = actNew.BillingStreet;
}
    }	
    Public static void Main1(List<account>accList){
        for(account ac:accList){
            list<opportunity>oppoList = [select Name,Id,StageName from opportunity where AccountId=:ac.Id AND createdDate = LAST_N_DAYS:30 AND 	StageName !='closed Won' ];
            for(opportunity op:oppoList){
                op.StageName ='closed Lost';
            }
            update oppoList;
        }
    }
    
    public static void Main2(list<account>accList){
        { 
          for(account ac:accList){
       messaging.SingleEmailMessage m1=new messaging.SingleEmailMessage(); 
       string[] toadd =new string[]{'ali266573@gmail.com' , 'luci47a@gmail.com','lucky_memon@amicusglobal.com'}; 
       m1.setToAddresses(toadd); 
       m1.setSubject('Account with name:' +ac.Name + 'succesfully created' ); 
       m1.setPlainTextBody('Account created Mail assignment question'+ac.Name + ac.AccountNumber ); 
       messaging.Email[] mail1=new messaging.Email[]{m1}; 
       messaging.sendEmail(mail1); 
          }
} 
        
    }
      public static void Main3(list<account>accList){
        { 
          for(account ac:accList){
       aggregateresult ar1 = [select Sum(Amount)total from opportunity where AccountId=:ac.Id ];
             
            //  integer i2 = (integer)ar1.get('total');
              ac.description = String.valueOf(ar1);
              ac.Total_Opportunity_Amount_c__c = (decimal)ar1.get('total');
          }
}
      }
public static void Main4(list<account>accList) {
	     List<Account> accObj = [Select id,BillingState,BillingCity  from Account]; 
    Map<string,Account> accMap = new  Map<string,Account>();
    
    for(Account ac : accObj){
        accMap.put(ac.BillingCity, ac);
        accMap.put(ac.BillingState, ac);
    }
    
    for(Account acc: accList){
        if(accMap.containsKey(acc.BillingCity)){
            acc.addError('Duplicate Record Found BillingCity '); 
        }
        else  if((accMap.containsKey(acc.BillingState))){
            acc.addError('Duplicate Record Found  BillingState'); 
        }
    }}


}