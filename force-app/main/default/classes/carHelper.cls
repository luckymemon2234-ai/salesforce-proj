public class carHelper {
    public static void Main(List<Cars__c>acList){
        for(Cars__c a:acList){
            {if(a.Price__c== Null)
                system.debug(a.Name);}
        }
    }

}