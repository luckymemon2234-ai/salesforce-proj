public class recordTypeCase {
      public static void Main(){
     //   List<RecordTypeId>conList = [select Subject, RecordTypeId from 'case'];
       List<RecordType>conList = [select Name,ID from RecordType where sObjectType='case'];
        for(RecordType c:conList){
            System.debug(conList);}
    }

}