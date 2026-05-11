public class studentCountHelper {
      public static void Main1( Map<Id, Student__c> NewMap){
           for(Student__c std  : NewMap.values()){

    
              List<class__c >cla = [select Name from class__c  where class__c.id =:std.class__c ];
          for(class__c  c:cla){
              List<Student__c> users = [SELECT Name FROM Student__c where class__c =: c.id ];
          
                c.count__c= String.valueOf(users.size() );
}
            update cla;
            
         }}
public static void Main3( Map<Id, Student__c> NewMap,map<Id , student__c>oldMap){
         for(Student__c std  : oldMap.values()){

    
    List<class__c >cla = [select Name from class__c  where class__c.id =:std.class__c];
        for(class__c  c:cla){
            List<Student__c> users = [SELECT Name FROM Student__c where class__c =: c.id ];
          
    c.count__c= String.valueOf(users.size() );
}
            update cla;
            
        }     for(Student__c std  : NewMap.values()){

    
    List<class__c >cla = [select Name from class__c where class__c.id =:std.class__c ];
        for(class__c  c:cla){
            List<Student__c> users = [SELECT Name FROM Student__c where class__c =: c.id ];
     
    c.count__c= String.valueOf(users.size() );
}
            update cla;
            
        }        

    } public static void Main2(Map<Id,Student__c>OldMap){
 

               for(Student__c std  : OldMap.values()){

    
    List<class__c>cla = [select Name from class__c  where class__c.id =:std.class__c ];
        for(class__c  c:cla){
            List<Student__c> users = [SELECT Name FROM Student__c where class__c =: c.id ];
        
    c.count__c= String.valueOf(users.size() );
}
            update cla;
            
               }}}