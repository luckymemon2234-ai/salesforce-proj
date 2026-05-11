@isTest 
public class accountAssignmentHelperTest {
    @isTest static void Main(){
        Account actNew= new Account();
        actNew.Name = 'Testing';
             actNew.BillingCity = 'test' ; 
			 actNew.BillingCountry = 'test';
			 actNew.BillingPostalCode= 'test';
			 actNew.BillingState = 'test';
			actNew.BillingStreet= 'test';
        
        Insert actNew;
        
        List<Account>accList = [select id,Name,shippingCity,shippingCountry,shippingPostalCode,shippingState,shippingStreet from Account where id=:actNew.Id];
        
        System.assertEquals(actNew.BillingCity , accList[0].shippingCity);
        System.assertEquals(actNew.BillingPostalCode , accList[0].shippingPostalCode);
        System.assertEquals(actNew.BillingState , accList[0].shippingState);
        System.assertEquals(actNew.BillingStreet , accList[0].shippingStreet);
    }
    
    @isTest static void Main2(){
        Account a= new Account();
        a.Name = 'MyAccountHacked';
        Opportunity opp = new Opportunity();
        opp.Name = 'Testing oppp';
        opp.CloseDate = system.today()-50;
        
        opp.StageName = 'prospecting';
        opp.AccountId = a.Id;
        
        insert opp;
        List<Account>accList = [select id,Name from account where Id=:a.Id];
        for(Account ax:accList){
            a.Name = 'MyAccountHacked2.0';
        }
        update accList;
        
       
        List<Opportunity>OppList = [ select id,stageName from Opportunity where id=:opp.Id];
        
        system.assertEquals(OppList[0].stageName , 'Closed Lost');
        
    }
}