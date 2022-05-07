public inherited sharing class mapOfListofStringsController {
    @AuraEnabled(cacheable=true)    
    public static map<String, list<String>> returnMapOfListValues() {
        map<String, list<String>> mapOfListValues = new map<String, list<String>>();
        
        mapOfListValues.put('India', new list<String>{'Hyderabad', 'Delhi', 'Mumbaie'});
        mapOfListValues.put('USA', new list<String>{'New York', 'Las Vegas', 'Miami'});
        mapOfListValues.put('China', new list<String>{'Shenzhen', 'Guangzhou', 'Shanghai'});
        return mapOfListValues;
    }
}