import { LightningElement, wire } from 'lwc';
import getAllAccountWithContactsList from '@salesforce/apex/AccountContactController.getAllAccountWithContacts';

export default class Accordianexample extends LightningElement {

    activeSectionMessage ='';

    @wire(getAllAccountWithContactsList)
    wiredAccountsWithContacts({ error, data }) {
        if (data) {
            this.accountsWithContacts = data;
            alert('Data:'+JSON.stringify(data));
        } else if (error) {
            alert('WrapperClassLWC error'+JSON.stringify(error));
            this.error = error;
        }
    }


    handleToggleSection(event) {
        this.activeSectionMessage = 'Opened Section is :' +event.detail.openSections;
    }
 
    handleSetActiveSectionA(){
        const accordion = this.template.querySelector('.ex-accordion');
        accordion.activeSectionName = 'A';
    }

    handleSetActiveSectionB(){
        const accordion = this.template.querySelector('.ex-accordion');
        accordion.activeSectionName = 'B';
    }

    handleSetActiveSectionC(){
        const accordion = this.template.querySelector('.ex-accordion');
        accordion.activeSectionName = 'C';
    }

    

}