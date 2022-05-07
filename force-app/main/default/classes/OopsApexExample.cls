public class OopsApexExample {
   
	 public static void travelMethod(Integer km, Boolean travel){
         if(km > 100){
             System.debug('Take Rest !'); 
             
         }
         else{
             System.debug('You are doing great !');
         }
         if(travel == true){
             work();
         }
         else if(travel == false){
             Account acc= new Account();
             acc.Name = 'Test';
             insert acc;
         }
    }
    public static void work(){
        System.debug('Called Work Method from Travel');
    }
    
}

// OopsApexExample.travel();
// OopsApexExample op = new OopsApexExample();
// op.travel();
// manasaEatingAndSheWillGoToSleep
// ManasaEatingAndSheWillGoToSleep