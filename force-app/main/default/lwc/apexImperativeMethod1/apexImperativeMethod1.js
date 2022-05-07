import { LightningElement } from 'lwc';
import loadContactsMethod from '@salesforce/apex/ContactControllerApex.getContactList';

export default class ApexImperativeMethod1 extends LightningElement {
    contacts;
    error;

    handleLoad(){
        loadContactsMethod()
        .then((result) => {this.contacts=result; this.error=undefined;})
        .catch((error) => {this.error=error; this.contacts=undefined});
    }
}