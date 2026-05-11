public class opptyProductNull {
    public static void Main(){
        List<Account>accList = [select name ,(select id,name from opportunities where RecordType.Name='Hardware_record_type' and Pricebook2Id != null  ) from account];
        //and Pricebook2Id != null AND Product2Id != null
        System.debug('add'+accList);
    }

}