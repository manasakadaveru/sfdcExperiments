import { LightningElement, api, track, wire } from 'lwc';
import getAccountList from '@salesforce/apex/ContactTableView.getAccountList';
export default class ContactTableViewComp extends LightningElement {
     @track columns = [{
        label: 'Id',
        fieldName: 'Id',
        type: 'Id',
        sortable: true
    },
    {
        label: 'Account Id',
        fieldName: 'AccountId',
        type: 'Lookup',
        sortable: true
    }
];
@api recordId;
    @track error;
    @track accList ;
    @wire(getAccountList, {recordId : '$recordId'})
    wiredAccounts({
        error,
        data
    }) {
        if (data) {
            this.accList = data;
        } else if (error) {
            this.error = error;
        }
    }
}