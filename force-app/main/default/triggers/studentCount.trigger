trigger studentCount on Student__c (after insert,after update,after delete) {
 
  
   if(trigger.isAfter){
        if(trigger.isInsert ){
            studentCountHelper.Main1(trigger.newMap);}
      else if( trigger.isUpdate)
          {
            studentCountHelper.Main3(trigger.newMap,trigger.oldMap);}
        
       else if(Trigger.isDelete){
             studentCountHelper.Main2(trigger.oldMap);
        }
    }
}