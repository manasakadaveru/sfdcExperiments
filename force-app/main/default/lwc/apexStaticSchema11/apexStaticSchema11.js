import { LightningElement, wire } from 'lwc';
import { getSObjectValue }  from '@salesforce/apex';
import getSingleContact from '@salesforce/apex/ContactControllerApex.getSingleContact';
import NAME_FIELD from '@salesforce/schema/Contact.Name';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';

export default class ApexStaticSchema extends LightningElement {
    @wire(getSingleContact) contact;

    get name() {
        return this.contact.data ? getSObjectValue(this.contact.data, NAME_FIELD) : '';
    }

    get email() {
        return this.contact.data
            ? getSObjectValue(this.contact.data, EMAIL_FIELD)
            : '';
    } 
}