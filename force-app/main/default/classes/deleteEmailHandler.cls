public class deleteEmailHandler {
    public static void blockEmailToCaseFromExternalDomains(List<opportunity> triggerNew)
    {try{
        
    
        List<opportunity> lst_CasesForDelete = new List<opportunity>();
        
        for (opportunity c: triggerNew)
        {
              //  c.addError('Cannot create external case with Email2Case'); 
                       sendTemplatedEmail(new List<String>{'lucky_memon@amicusglobal.com'}, null, new List<String>{'lucky_memon@amicusglobal.com',''}, 'Employee_approvere', '00X5g000000RjrJEAS', null, 'no-reply@perfectomobile.com',false);            
                                              

        }}
     catch(exception e){
         system.debug('error'+e.getmessage());
     }
    }
public static void sendTemplatedEmail(String[] toRecipients, String[] ccRecipients, String[] bccRecipients, String templateApiName, ID targetObjId, Id whatId, String fromaddress, Boolean saveAsActivity) 
    {      
        try{
            
       
    Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        
   // Id templateId = [select id, name from EmailTemplate where developername = : templateApiName].id;
   Id templateId ='00X5g000000RjrJEAS';
            email.setToAddresses(toRecipients);
        email.setCcAddresses(ccRecipients);
        email.setBccAddresses(bccRecipients);
       email.setTargetObjectId(targetObjId);
        email.setWhatId(whatId);
     //   email.setSenderDisplayName(fromaddress);
        email.setTemplateId(templateId);
        email.setSaveAsActivity(saveAsActivity);  
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
            return;
             }
         catch(exception e){
         system.debug('error'+e.getmessage() + ' ' + e.getlinenumber());
     }
    }
    
    public static void Main(List<Opportunity>oppList){
         for (opportunity cc : oppList)
 
    {
 
    cc.addError('Unable to delete record!');
 
    }     
 
    }
}