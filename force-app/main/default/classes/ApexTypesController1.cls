public with sharing class ApexTypesController1 {

    @AuraEnabled(cacheable=true)
    public static string checkingApexType(CustomWrapper wrapper){

        System.debug(wrapper);

        String res = 'You entered "' +wrapper.someString+'" this list contains '+wrapper.someList.size()+' items..';
        return res;
    }
}