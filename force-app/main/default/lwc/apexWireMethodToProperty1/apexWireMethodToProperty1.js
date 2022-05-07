import { LightningElement, wire } from 'lwc';
import getContactListMethos from '@salesforce/apex/ContactController.getContactList';

export default class ApexWireMethodToProperty1 extends LightningElement {
    //If we don’t want to operate on returned data and just want to show that on UI. Then we can wire a property.
    //@wire(getContactListMethos) contacts; //This one is Wired a Property

    contacts;
    error;

    @wire(getContactListMethos)

    wiredContacts({ data, error}) {
        if (data) {
            this.contacts = data;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.contacts = undefined;
        }
    }
    
}