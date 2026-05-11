public class sorting {
      public static void Main(){
        List<Integer>ill = new List<Integer>{7,3,4,5,2,8,9};
        integer n = ill.size();
integer  tmp = 0;
for(integer  x=0; x < n; x++){
for(integer  y=1; y < (n-x); y++){
if(ill[y-1] > ill[y]){
//swap elements
tmp = ill[y-1];
ill[y-1] = ill[y];
ill[y] = tmp;
}
}
}
    for(integer i:ill){
    System.debug(i);}
    system.debug(ill);
    }

}