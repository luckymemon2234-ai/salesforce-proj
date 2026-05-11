trigger AssignmentAccount on Account (before insert,before update,after insert) {
    if(trigger.isBefore){
        if(trigger.isInsert ){
            
            assignmentAccountHelper.billingAddress(trigger.new);
             
             assignmentAccountHelper.duplicateRecord(trigger.new);     
        }
 if(trigger.isUpdate ){
            
            assignmentAccountHelper.updateOppty(trigger.newMap);
            assignmentAccountHelper.totalOppty(trigger.new); 
            assignmentAccountHelper.duplicateRecord(trigger.new); 

}}
        if(trigger.isAfter){
            if(trigger.isInsert ){
                assignmentAccountHelper.sendMail(trigger.new);
            }
            
        }


}