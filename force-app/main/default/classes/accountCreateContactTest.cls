@isTest
public class accountCreateContactTest {
    @isTest static void Main(){
        Account a = new Account();
        a.Name = 'testing';
        
        insert a;
        List<Contact>cList = [select id,LastName from contact where accountId=:a.Id];
        System.assertEquals(10, cList.size());
         List<AccountTeamMember>atm = [select Id from AccountTeamMember where accountId=:a.Id];
      //  System.assert(!atm.isEmpty());
      System.assertEquals(0, atm.size());
    }

}