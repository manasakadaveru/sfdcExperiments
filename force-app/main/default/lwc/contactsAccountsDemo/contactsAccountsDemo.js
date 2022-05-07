import { LightningElement, api, track, wire } from 'lwc';
import getContactList from '@salesforce/apex/ContactsAccountsDemo.getRelatedContactList';
import { updateRecord } from 'lightning/uiRecordApi';
import { refreshApex } from '@salesforce/apex';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

const COLS = [
    { label: 'First Name', fieldName: 'FirstName', editable: true },
    { label: 'Last Name', fieldName: 'LastName', editable: true },
    { label: 'Title', fieldName: 'Title', editable: true },
    { label: 'Phone', fieldName: 'Phone', type: 'phone', editable: true  },
    { label: 'Email', fieldName: 'Email', type: 'email', editable: true  }
];
export default class ContactsAccountsDemo extends LightningElement {
    @api recordId;
    @track error;
    @track columns = COLS;
    @track draftValues = [];

    @wire(getContactList, { accId: '$recordId' })
    contact;

    handleSave(event) {
        const recordInputs =  event.detail.draftValues.slice().map(draft => {
            const fields = Object.assign({}, draft);
            return { fields };
        });
    
        const promises = recordInputs.map(recordInput => updateRecord(recordInput));
        Promise.all(promises).then(contacts => {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Success',
                    message: 'Contacts updated',
                    variant: 'success'
                })
            );
             this.draftValues = [];
    
             return refreshApex(this.contact);
        }).catch(error => {
        });
    }
}