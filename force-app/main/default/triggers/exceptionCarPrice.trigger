trigger exceptionCarPrice on Cars__c (before insert) {
 if(trigger.isBefore){
    if(trigger.isInsert){
        carHelper.Main(trigger.new);
    }}
}