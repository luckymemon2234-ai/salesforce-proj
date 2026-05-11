trigger countContact on Contact (after insert ,after delete ,after update,after undelete) {

   if(trigger.isAfter){
        if(trigger.isInsert || trigger.isUpdate || trigger.isDelete || trigger.isUndelete) {
           //countContactHelper.countContacts(trigger.new,trigger.old);
        }
            }

}