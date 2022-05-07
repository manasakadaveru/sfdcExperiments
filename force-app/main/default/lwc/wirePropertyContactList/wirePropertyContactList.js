import { LightningElement, track, wire } from 'lwc';
import getContactListMethod from '@salesforce/apex/ContactControllerExmple.getContactLists';

export default class WirePropertyContactList extends LightningElement {
 
    @track contactsData;
    @track errorData;

    handleLoadingContacts(){
        getContactListMethod()
            .then(result => {
                this.contactsData = result;
            })
            .catch(error => {
                this.errorData = error;
            });
    }

}