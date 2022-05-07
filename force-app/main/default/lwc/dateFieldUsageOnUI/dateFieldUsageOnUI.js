import { LightningElement, track, wire, api } from 'lwc';
import getDateFieldValue from '@salesforce/apex/ContactsAccountsDemo.getDateFieldMethod';

export default class DateFieldUsageOnUI extends LightningElement {
    @track dateInputField;
    @track data1;
    @track errorMsg1;
    @api recordId;
    
    //@wire(getDateFieldValue, {getDate : this.dateInputField}) date;
    handleDateChange(event){
        this.dateInputField = event.target.value;
    }
    handleSubmit(){
        alert('date value -->'+this.dateInputField);
        getDateFieldValue({getDate : this.dateInputField})
        .then(result =>{
            this.data1 = result;
        })
        .catch(error =>{
            this.errorMsg1 = error;
        })
    }
}