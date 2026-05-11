public class validatelength {
     public static void Main(){
         
        List<String>str = new List<String>{'Astro Chicken & Ribs Joint' };
        List<Opportunity> oppo1 = new List<Opportunity>();
            List<opportunity> oppo = [Select Name,Id from opportunity where Name = :str limit 1];
       
        for(opportunity o:oppo){
             string  Nam = o.Name;
            opportunity op = new opportunity();
            if(o.Name >'20'){
                
                system.debug('true'+o.Name.length());
               
              Nam = o.Name.substring(0, 18);
                  op.Name = Nam;
             op.Id = o.Id;
                oppo1.add(op);
                
                   
                  
                    update oppo1; 
                
                
                system.debug('old name'+o.Name + o.Name.length());
                system.debug('new name'+ Nam + Nam.length()); 
                
              
                
                
            
     }   
    else{
                system.debug('false' );
            }
        }
  
     }
     

}