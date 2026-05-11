public class sendEmail {
     public static void sendEmail() {
        List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();
          List<String> address = new List<String>{'ali26573@gmail.com','lucky_memon@amicusglobal.com'};
        EmailTemplate emailTemp = [Select id, Subject, Body From EmailTemplate Where DeveloperName = 'Opportunity_if_stage_is_open'];
        Contact con = [Select Id, Email from Contact where LastName ='Test' Limit 1];
        
        
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setTemplateId(emailTemp.Id);
       mail.setTargetObjectId(con.Id);
          mail.setToAddresses(address);
        emailList.add(mail);
        
        if(!emailList.isEmpty()){
            Messaging.sendEmail(emailList);
        }    
    }

}