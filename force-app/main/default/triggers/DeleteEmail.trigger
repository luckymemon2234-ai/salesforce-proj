trigger DeleteEmail on opportunity (Before Delete) {  
 
    if(Trigger.isBefore && Trigger.isDelete){       
 
        for(opportunity c : Trigger.old){
 
            
 
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
 
        email.setToAddresses(new String[] {'lucky_memon@amicusglobal.com'});
 
        email.setSubject('They are try to Delete Canadian Project Management Alert');
 
        email.setPlainTextBody('This message is to alert you that the  Project Management named ' + c.Name + ' has been deleted.');
        // Messaging.sendEmail( new email);
    messaging.sendemail(new Messaging.SingleEmailMessage[] {email} );
            //  emails.add(email);
 system.debug(email);
             deleteEmailHandler.Main(trigger.old);
            
    }
 


       
    }
 
    }