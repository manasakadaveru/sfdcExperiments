import { LightningElement, api, track, wire } from 'lwc';
import getRelatedContactList from '@salesforce/apex/ContactDemo.getContactList';
import getWorkOrderList from '@salesforce/apex/ContactDemo.getWorkOrderList';
import { updateRecord } from 'lightning/uiRecordApi';
import { refreshApex } from '@salesforce/apex';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

const COLS = [
    { label: 'First Name', fieldName: 'FirstName', editable: true },
    { label: 'Last Name', fieldName: 'LastName', editable: true },
    { label: 'Title', fieldName: 'Title', editable: true },
    { label: 'Phone', fieldName: 'Phone', type: 'phone', editable: true  },
    { label: 'Email', fieldName: 'Email', type: 'email', editable: true },
];

const WOCOLS = [
    { label: 'WO number', fieldName: 'Name', editable: true },
    { label: 'Status', fieldName: 'Status__c', editable: true }
];

export default class ContactDemo extends LightningElement {
    
        @api recordId;
        @track error;
        //@track columns = COLS;
        @track draftValues = [];

        @track woColumns = WOCOLS;

        // @wire(getRelatedContactList, { accntId: '$recordId' })
        // contact;
     
        @wire(getWorkOrderList)
        workorder;

        // handleContactView(event) {
        //     // Navigate to contact record page
        //     this[NavigationMixin.Navigate]({
        //         type: 'standard__recordPage',
        //         attributes: {
        //             recordId: event.target.value,
        //             objectApiName: 'Contact',
        //             fieldName: 'Name',
        //             actionName: 'view',
        //         },
        //     });
        // }
     
        handleWOSave(event) { 
            alert('Entered');
            const recordInputs =  event.detail.draftValues.slice().map(draft => {
                const fields = Object.assign({}, draft);
                return { fields };
            });
            alert('fields >>>>>>'+JSON.stringify(recordInputs));
            const promises = recordInputs.map(recordInput => updateRecord(recordInput));
            Promise.all(promises).then(contacts => {  
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: 'Contacts updated'+' '+contacts.Status__c,
                        variant: 'success'
                    })
                );
                 this.draftValues = [];
        
                 return refreshApex(this.workorder);
            }).catch(error => {
                alert('Error ?'+JSON.stringify(error));
            });
            alert('Reched +');
        }
}