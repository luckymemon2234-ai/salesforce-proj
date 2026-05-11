public class accountAll {

@AuraEnabled
public static List<Account> GetAccount()
{
List<Account> lstAccount=[Select Id,Name,BillingState,BillingCity,Phone FROM Account limit 30 ];
return lstAccount;
 
}
      @AuraEnabled
    public static List<Account> findByName(String searchKey) {
        String name = '%' + searchKey + '%';
        return [SELECT id, name, phone,type FROM Account WHERE name LIKE :name limit 5];
    }
}