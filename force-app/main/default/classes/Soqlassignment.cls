public class Soqlassignment {
    public static void Soql(){
        //a.Fetch Top 5 Contacts based on createddate
         Date d = Date.newInstance(1995, 09, 14);
        List<Contact> conList = [Select Name,Birthdate,AccountId from Contact where createdDate >= :d limit 5 ];
        for(Contact a:conList){
            System.debug('contact details from query 1'+  a.Name +'  '+ a.Birthdate +'   ' + a.AccountId);
        }
        
        //Fetch Account and Associated Contacts with Single SOQL query
          List<contact> accList = [Select id,Name, account.Name from contact];
        for(contact  a:accList){
            system.debug(a.name + a.account.Name);
        }
        /* List<Account> accList = [Select Name,AccountNumber, (Select Name from Contacts) from Account];
        for(Account a:accList){
            System.debug( 'Account from query 2:' + a.Name);
            List<Contact> coList=a.Contacts;
            for(Contact con:coList)
            {
                System.debug('contact from query 2:'  + a.Name);
            }
        }
        */
        //c.Fetch Opportunity and associated line Items with single SOQL query
         List<opportunity > oppoList = [Select Name, (Select Name from OpportunityLineItems ) from opportunity];
        for(opportunity o:oppoList){
            System.debug(o.Name);
            
        List<OpportunityLineItem> oliList = o.OpportunityLineItems;
            for(OpportunityLineItem oli:oliList){
                System.debug('query3 opportunitylineitem:' + oli.Name);
            }
        }
        
        //Fetch count of case records where status is new
    
           AggregateResult ar1 = [select Count(ID) from case  where Status = 'New'];
        System.debug('query 4 :' + ar1);
        //second method
        integer i = [select Count() from case  where Status = 'New'];
         System.debug('query 4 method 2 :' + i);

        //    Prepare SOQL query using Aggregate functions like AVG(),MIN(),Max(),Sum(),Count()
         
        //avg
        AggregateResult ar2 = [select Avg(Amount),MAX(Amount),Sum(Amount),Count(ID),Min(Amount) from Opportunity];
        System.debug('query 5 :'+ ar2);
       //
       //f.Fetch Account,Contacts,Opportunities where Name like Test using a Single SOQL query
            //   List<Contact> contactlist = [select Name , Account.Name,(Select Name from Opportunities) from Contact where Name like '%Test%' ];
     //  for(Contact col:contactlist){
         //   System.debug('1Contact name: '+col.Name +'Account name: ' + col.Account.Name);
        
    //   list<opportunity> oplist = col.Opportunities;
     //      for(opportunity opp: oplist){
     //       System.debug( '1oppo Name:'+opp.Name);
              //  }}
        List<Account> accoList = [Select Name, (Select Name from Contacts), (Select Name from Opportunities) from Account ];//Where Name Like '%Test%'
        for(Account a:accoList){
            List<Contact> contList = a.Contacts;
            for(Contact c:contList){
                List<Opportunity> opporList = a.Opportunities;
                for(Opportunity o:opporList){
                    System.debug('Account query 6 : '+ a.Name + 'contact : ' + c.Name + 'Opportunity : ' + o.Name  );
                  
                }   
            }}
        //a. Fetch User territories information with the following columns
        List<UserTerritory2Association>terList = [Select  User.Name,Territory2.Name from UserTerritory2Association];
        for(UserTerritory2Association o:terList){
            System.debug('User Name 7 : '+ o.User.Name + 'Territory Name : ' + o.Territory2.Name  );
        }
            }
    
}