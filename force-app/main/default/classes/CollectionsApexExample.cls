public class CollectionsApexExample {
    public CollectionsApexExample(){
        System.debug('Constructors Method');
    }
    public CollectionsApexExample(String name){
        System.debug('Constructors Method'+name);
    }
    
	//LIST
    public static void listExample(){
        List<String> flower = new List<String>{'Rose', 'Jasmin', 'Lilly','Rose','Jasmin', 'Lilly'};
            flower.add('others');
            for(String str : flower){
                System.debug('Flower Types ->'+str);
            }
       	List<Contact> cont = [Select Id, AccountId from Contact]; 
		Set<Id> accIds = new Set<Id>();
        
        
    }
    
    //SET
    public static void setExample(){
        Set<String> vehicles = new Set<String>();
        vehicles.add('car');
        vehicles.add('bike');
        vehicles.add('auto');
        vehicles.add('lorry');
        vehicles.add('car');
        vehicles.add('bike');
        vehicles.add('auto');
        vehicles.add('lorry');
        System.debug('Exapls of set'+vehicles );
    } 
    
	//MAP
    public static void mapMethod(){
        Map<String, String> map1 = new Map<String, String>();
        map1.put('1', 'One');
        map1.put('2', 'Two');
        map1.put('3', 'Three');
        map1.put('4', 'Four');
        System.debug('map1--> '+map1);
        System.debug('map1--> '+map1.keySet());
        if(map1.containsKey('0')){
            System.debug('TRUE');
        }
    }
    
    
    
	
}