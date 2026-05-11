public class Soqlallaccount {
    public static void Allaccount(){
        AggregateResult ar1 = [Select sum (Amount ) from Opportunity ];
        {
            System.debug(ar1);
        }
    }
}