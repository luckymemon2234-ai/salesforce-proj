public class accountFind {

      @AuraEnabled
    public static List<Account> findAccountName(String searchAccount) {
        String name = '%' + searchAccount + '%';
       List<Account> returnList = new List<Account> ();
       List<Account> lstOfAccount = [select id, Name, Type, Phone from account where Name LIKE :name LIMIT 10];
        
          for (Account acc: lstOfAccount) {
              returnList.add(acc);}
          
         return returnList;
            }  
    }