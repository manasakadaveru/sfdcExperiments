import { LightningElement, wire } from 'lwc';
import getContacts from '@salesforce/apex/ContactController.getContacts';
import NAME_FIELD from '@salesforce/schema/Contact.FirstName';
import REVENUE_FIELD from '@salesforce/schema/Contact.LastName';
import INDUSTRY_FIELD from '@salesforce/schema/Contact.Email';
import { reduceErrors } from 'c/ldsUtils'; 

const COLUMNs =[
    {label: 'First Name', fieldName: NAME_FIELD.fieldApiName, type: 'text'},
    {label: 'Last Name', fieldName: REVENUE_FIELD.fieldApiName, type: 'text'},  
    {label: 'Email', fieldName: INDUSTRY_FIELD.fieldApiName, type: 'email'}
];
export default class ContactList extends LightningElement {

    columns = COLUMNs;
    @wire(getContacts) contacts;

    get errors() {
        return (this.contacts.error) ?
            reduceErrors(this.contacts.error) : [];
    }

}