public class deleteOpty {
     public static void Main(){
        List<String>str = new List<String>{'Amazon inc'};
        List<opportunity>oppo = new List<opportunity>();
        oppo = [select Name from opportunity where Name=:str];
        
        delete oppo;
    }

}