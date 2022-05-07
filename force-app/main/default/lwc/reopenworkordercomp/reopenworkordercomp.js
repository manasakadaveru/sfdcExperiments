import { api, LightningElement, track, wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { refreshApex } from '@salesforce/apex';
import reOpenWOMethod from '@salesforce/apex/ReopenClosedWO.reOpenWorkOrderMethod';
import { updateRecord } from 'lightning/uiRecordApi';

import ID_FIELD from '@salesforce/schema/Work_Order__c.Name';
import STATUS_FIELD from '@salesforce/schema/Work_Order__c.Status__c';

alert('Am outside');
export default class Reopenworkordercomp extends LightningElement {
    disabled = false;
    @track error;

    @wire(reOpenWOMethod) 
    Work_Order__c;
    
    handleChange(event){
        if (!event.target.value) {
            event.target.reportValidity();
            this.disabled = true;
        }
        else {
            this.disabled = false;
        }
    }

    updateWorkOrderStatus(){
        // Create the recordInput object
        const allValid = [...this.template.querySelectorAll('lightning-input')]
            .reduce((validSoFar, inputFields) => {
                inputFields.reportValidity();
                return validSoFar && inputFields.checkValidity();
            }, true);

        if (allValid) {
            // Create the recordInput object
        const fields = {};
        fields[ID_FIELD.fieldApiName] = this.Name;
        fields[STATUS_FIELD.fieldApiName] = this.template.querySelector("[data-field='Status__c']").value;

        const recordInput = { fields };

        updateRecord(recordInput)
            .then(() => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: 'Contact updated',
                        variant: 'success'
                    })
                );
                // Display fresh data in the form
                return refreshApex(this.contact);
            })
            .catch(error => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error creating record',
                        message: error.body.message,
                        variant: 'error'
                    })
                );
            });
        }
        else{
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Something is wrong',
                    message: 'Check your input and try again.',
                    variant: 'error'
                })
             );
        }
    }
    
    /*@wire(reOpenWOMethod, {woId : '$workOrderID'})

    updateRecord({ error, data }) {
        //alert('Am in Onclick');
        alert('Am in Onclick with data'+data);
        alert('Am in Onclick with error'+error);
        if (data) {
            alert('Am in Onclick with if loop'+workOrderID);
            this.openWO = data;
            this.error = undefined;
        } else if (error) {
            alert('Am in Onclick with error loop'+workOrderID);
            this.error = error;
            this.openWO = undefined;
        }
    }*/
    

}