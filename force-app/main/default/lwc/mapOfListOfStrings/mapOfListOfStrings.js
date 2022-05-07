import { LightningElement, track, wire } from 'lwc';
import getMapOfData from '@salesforce/apex/mapOfListofStringsController.returnMapOfListValues';

export default class MapOfListOfStrings extends LightningElement {
    @track mapOfListValues = [];

    @wire(getMapOfData)
    mapOfData({data, error}) {
        if(data) {
            for(let key in data) {
                
                if (data.hasOwnProperty(key)) { // Filtering the data in the loop
                    this.mapOfListValues.push({key: key, value: data[key]});
                }
                
            }
            //alert('Map of data:'+ JSON.stringify(this.mapOfListValues));
            console.log('Map of data:'+JSON.stringify(this.mapOfListValues));
        }
        else if(error) {
            window.console.log(error);
        }
    }
}