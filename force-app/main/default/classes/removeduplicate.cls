public class removeduplicate {
    public static void Main(){
         List<integer>it = new List<integer>{8,2,1,7,7,3,2,8};
           
            for(integer i=0;i<it.size()-1;i++){
                for(integer j = i+1;j<=it.size()-1;j++){
                    if(it[i]==it[j]){
                        it.remove(j);
                    }
                    
                }
            }
         for(integer iz:it){
                system.debug(iz);
            }
        system.debug(it);
    }

}