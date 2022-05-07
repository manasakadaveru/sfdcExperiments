import { api, LightningElement, track, wire } from 'lwc';
import getContactList from '@salesforce/apex/ContactsAccountsDemo.getRelatedContactList';

const COLS = [
    { label: 'First Name', fieldName: 'FirstName', editable: true },
    // { label: 'Last Name', fieldName: 'LastName', editable: true },
    // { label: 'Title', fieldName: 'Title', editable: true },
    // { label: 'Phone', fieldName: 'Phone', type: 'phone', editable: true  },
    { label: 'Email', fieldName: 'Email', type: 'email', editable: true  }
];
export default class CbcAddressChangeLWC extends LightningElement {
    @api recordId;
    @track columns = COLS;

    @wire(getContactList, { accntId: '$recordId' })
    contact;
}