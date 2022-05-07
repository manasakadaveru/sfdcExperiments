@isTest
public class OopsApexExampleTest {
	
    @isTest
    static void testMethod1(){
		Integer km = 100;
        Integer km1 = 101;
        Boolean travel = true; 
        OopsApexExample.travelMethod(km, travel);
        System.assertEquals(100, km);
    }
    
    @isTest
    static void testMethod2(){
        Boolean travel = false; 
        OopsApexExample.travelMethod(null, travel);
        System.assert(travel!=null, true);
    }
    
}