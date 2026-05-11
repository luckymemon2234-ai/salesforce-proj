trigger AccountAssignment on Account (before insert,before update) {
    if(trigger.isBefore){
        if(trigger.isInsert ){
            
             accountAssignmentHelper.Main(trigger.new);
             accountAssignmentHelper.Main2(trigger.new);
             accountAssignmentHelper.Main4(trigger.new);     
        }
        if(trigger.isUpdate ){
            
            accountAssignmentHelper.Main1(trigger.new);
            accountAssignmentHelper.Main3(trigger.new); 
            accountAssignmentHelper.Main4(trigger.new); 

        }


}

}