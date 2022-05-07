import { LightningElement, wire } from 'lwc';

import getSingleContactMethod from '@salesforce/apex/ABControllerOfcontact.getSingleContact';

export default class ApexMethodtoWireProperty extends LightningElement {

    //@wire(getSingleContactMethod) contacts;

    contacts;
    error;

    @wire(getSingleContactMethod)
    wiredContacts({ error, data }) {
        if (data) {
            this.contacts = data;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.contacts = undefined;
        }
    }

}