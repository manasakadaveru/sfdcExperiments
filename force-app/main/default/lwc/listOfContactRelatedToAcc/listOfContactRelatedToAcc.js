import { LightningElement, api, track, wire } from 'lwc';
import getRelatedContactList from "@salesforce/apex/ContactsRelatedToAccounts.getRelatedContactList";
import { updateRecord } from 'lightning/uiRecordApi';
import { refreshApex } from '@salesforce/apex';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
const COLS = [
    { label: 'First Name', fieldName: 'FirstName', editable: true },
    { label: 'Last Name', fieldName: 'LastName', editable: true },
    { label: 'Email', fieldName: 'Email', type: 'email' }
];
export default class ListOfContactRelatedToAcc extends LightningElement {
    @api recordId;
    @track error;
    @track columns = COLS;
    @track draftValues = [];
    @wire(getRelatedContactList, { accId: '$recordId' })
    
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
             // Clear all draft values
             this.draftValues = [];
    
             // Display fresh data in the datatable
             return refreshApex(this.contact);
        }).catch(error => {
            // Handle error
        });
    }
}