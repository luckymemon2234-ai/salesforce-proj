trigger accountCreatecontact on Account (after insert, after update) {
     List<Contact>clist = new List<Contact>();
    for(account a:trigger.new ){
        if(trigger.isInsert){
           
            for(integer i =0;i<10 ; i++){
                contact c = new contact();
                c.lastName = a.Name+i ;
                c.AccountId = a.Id;
                clist.add(c);
            }
            
        }}
    insert clist;
        
        List<AccountTeamMember>atm = new List<AccountTeamMember>();
        for(account a:trigger.new ){
        if(a.Hardware_Owner__c != null ){
           AccountTeamMember at = new AccountTeamMember()  ;
            at.UserId =a.Hardware_Owner__c;
            at.accountId = a.Id;
            at.TeamMemberRole = 'Account Manager';
            at.AccountAccessLevel = 'Edit';
            atm.add(at);
        }
        
        
        
    }
insert atm;
}