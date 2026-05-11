public class assignmentAccountHandler {
    public static void billingAddress(List <account>accList){ 
        for(Account actNew:accList){
            
			actNew.ShippingCity = actNew.BillingCity; 
			actNew.ShippingCountry = actNew.BillingCountry;
			actNew.ShippingPostalCode = actNew.BillingPostalCode;
			actNew.ShippingState = actNew.BillingState;
            actNew.ShippingStreet = actNew.BillingStreet;}

    }	
   // Public static void Main1(List<account>accList){
     //   set<id>accid = new set<id>();
     //   for(account ac:accList){
//            accid.add(ac.Id);
       // }
        //    list<opportunity>oppoList = [select Name,Id,StageName from opportunity where AccountId =:accid AND
        //                                 createdDate > LAST_N_DAYS:30 AND 	StageName !='closed Won' ];
        //    for(opportunity op:oppoList){
         //       op.StageName ='closed Lost';
        //    }
         //   update oppoList;
        
   // }
public static void updateOppty(Map<id,account>accMap){
 Map<Id,Account> nMap = new Map<Id,Account>();

    nMap = accMap;
   DateTime day30=system.now()-30;
      
            list<opportunity>oppoList = [select Name,Id,StageName,CreatedDate,closeDate from opportunity where AccountId in :nMap.keySet() AND
                            StageName !='closed Won' ];
            for(opportunity op:oppoList){
              if(op.CloseDate<day30){
                    op.StageName ='Closed Lost';
              }
         }
    update oppoList;
         
        
    }    
    public static void sendMail(list<account>accList){
    list<user>userList = [select email from user where Profile.Name ='system administrator' ];
    List<String> sendTo = new List<String>();
    for(user s:userList){
        sendTo.add(s.email);
    }
         for(account ac:accList){
         messaging.SingleEmailMessage m1=new messaging.SingleEmailMessage(); 
   //   string[] toadd =new string[]{'ahmed007637@gmail.com'}; 
      m1.setToAddresses(sendTo); 
       m1.setSubject('Account with name:' +ac.Name + 'succesfully created' ); 
      m1.setPlainTextBody('Account created Mail assignment question'+ac.Name  ); 
       messaging.Email[] mail1=new messaging.Email[]{m1}; 
   messaging.sendEmail(mail1); 
         }}
        
   // }
  //  public static void sendMail(list<account>accList){
      //  User userObj=[select Id,Profile.Name,Email from user where Profile.Name='System Administrator'  ];
  //  for(account act:accList){
                
         //   List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();
          // if(userObj.Email!=null){
         //  Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
      //  mail.setSubject('New Account Created');
      //  mail.setplaintextbody('An account has been created and the name is:'+act.Name);
      //  mail.toAddresses = new String[]{userObj.Email};
       // emailList.add(mail);
        
    //  if(!emailList.isEmpty()){
     //       Messaging.sendEmail(emailList);
     //  }       
  // }
     // }
        
         // } 
      public static void totalOppty(list<account>accList){
        { set<id>accid = new set<id>();
        for(account ac:accList){
            accid.add(ac.Id);
        }
                aggregateresult ar1 = [select Sum(Amount)total from opportunity where AccountId=:accid ];
          for(account ac:accList){

             
            //  integer i2 = (integer)ar1.get('total');
              ac.description = String.valueOf(ar1);
              ac.Total_Opportunity_Amount_c__c = (decimal)ar1.get('total');
          }
}
      }
public static void duplicateRecord(list<account>accList) {
	   //  List<Account> accObj = [Select id,BillingState,BillingCity  from Account]; 
	   //  
    List<Account> accObj =new List<account>();
    list<id>accid = new list<id>();
        for(account ac:accList){
            accid.add(ac.Id);
        }          
          accObj = [Select BillingState,BillingCity  from Account where id   !=: accid];       
    Map<string,Account> accMap = new  Map<string,Account>();    
    for(Account ac : accObj){
        accMap.put(ac.BillingCity, ac);
        accMap.put(ac.BillingState, ac);
    }
    
    for(Account acc: accList){
        if(accMap.containsKey(acc.BillingCity) && acc.BillingCity != Null){
            acc.addError('Duplicate Record Found BillingCity '); 
        }
        else  if((accMap.containsKey(acc.BillingState))&& acc.BillingState != Null){
            acc.addError('Duplicate Record Found  BillingState'); 
        }
    }}
    
    

}