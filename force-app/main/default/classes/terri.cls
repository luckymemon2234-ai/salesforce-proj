public class terri {
    public static void terr(){
        List<UserTerritory2Association>terList = [Select  User.Name,Territory2.Name from UserTerritory2Association];
        for(UserTerritory2Association o:terList){
            System.debug(o.User.Name+Territory2.Name);
        }
        
    }

}