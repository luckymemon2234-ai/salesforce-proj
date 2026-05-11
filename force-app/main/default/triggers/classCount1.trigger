trigger classCount1 on class__c (before insert,before update) {
    for(class__c cls : trigger.new){
    List<class__c> users = [SELECT Name, (SELECT id FROM Students__r) FROM class__c where id =:cls.id];
for (class__c u : users) {
    
  cls.Count__c = String.valueOf( u.Students__r.size());
}
     update users;  
    }
}