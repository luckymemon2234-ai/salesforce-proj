public class AccountHandler {
     public static account insertNewAccount(string str){
        

        try {
           Account acc = new Account();
        
        acc.name=str;
        
        insert acc;
            system.debug('account name:' + acc.name +'account id'+ acc.Id);
            return acc;
}      catch(DmlException e) {
            System.debug('The following exception has occurred: ' + e.getMessage());
            return null;
}
        
        
    }

}