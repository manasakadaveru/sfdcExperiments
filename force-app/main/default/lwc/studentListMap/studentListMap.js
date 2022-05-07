import { LightningElement, track, wire, api } from 'lwc';
import getAllLocationsMethod from '@salesforce/apex/StudentController.getAllLocations'

export default class StudentListMap extends LightningElement {

    @track mapMarkers;
    mapTitle = 'Students WorldWide';
    @api listVisible = 'visible';

    @wire(getAllLocationsMethod)
    wiredGetAllLocationsMethod({data,error}){

        this.mapMarkers =[];

        if(data){
            data.forEach(locElement => {
                
                this.mapMarkers.push({
                    location : {
                        City : locElement.MailingCity,
                        Country :locElement.MailingCountry
                    },
                    description : locElement.MailingStreet+ '::' + locElement.MailingCity + '::' + locElement.MailingCountry
                });

            });
        }else if(error){

        }

    }
}