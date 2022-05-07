import { LightningElement, wire, api, track } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';

import CITY from '@salesforce/schema/Contact.MailingCity';
import COUNTRY from '@salesforce/schema/Contact.MailingCountry';

import { _getDisplayValue } from 'c/util';

//fetching fields through static schema 
const FIELDS = [CITY, COUNTRY];

export default class StudentMap extends LightningElement {

    @api studentId;
    @track mapMarkers = [];

    //if any property changing dynamically we have to get it from wire property using '$property'
   @wire(getRecord, {recordId: '$studentId', fields : FIELDS})

   loadContact({data,error}){
       if(data){
           const City = _getDisplayValue(data, CITY );
           const Country = _getDisplayValue(data, COUNTRY);

            this.mapMarkers = [
                {
                    location : { City, Country },
                    description : `Coords :: ${City}${Country}` //"Coords ::"+ City + ' ----- '+Country // here we can use `Coords :: ${City}$Country`
                                                                        // `` this will automatically cancatenate strings
                }
            ];  
       }
       else if(error){

       }
   }

}