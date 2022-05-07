import { api, LightningElement, wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import apexUpdateRecord from '@salesforce/apex/ReopenClosedWoEx.saveWORecord';

export default class Reopenclosedwoex extends LightningElement {
    enableSpinner = false;
    @api recordId;
    
    connectedCallback(){
        this.enableSpinner = true;
        apexUpdateRecord({recordId : this.recordId})
        .then(result=> {const closeQA = new CustomEvent('close');            
            const evt = new ShowToastEvent({
                message: 'Opened Successfully!',
                variant  : 'success'
            });
            // Dispatches the event.
            this.dispatchEvent(evt);
            this.dispatchEvent(closeQA);
            this.enableSpinner =false;
        })
        .catch(error => {alert(JSON.stringify(this.error))});
    }

    
    /*@api recordId;
    @api Status = 'Open';

    @wire(apexFetchingRecord, {recordId: '$recordId' })
    opptiesOverAmount;

    handleSaveChange(e) {
        apexUpdateRecord({
            Status: this.Status
        })
        .then(() => {
            refreshApex(this.opptiesOverAmount)
            .then(() => {
                this.message = 'Updated Successfully';
            });
        })
        .catch((error) => {
            this.message = 'Error received: code' + error.errorCode + ', ' +
                'message ' + error.body.message;
        });
    }*/
    

    /*@api recordId;
    @api wiredWorkOrder;

    (@wire(methodFromApex, {workOrderId : '$recordId' }) 
    hasWoRecord(response){
        this.wiredWorkOrder = response;
        this.realFormData = {... this.wiredContact.data};
        alert('WO record :'+ workOrderId);
    }

    saveChanges(event){
        this.realFormData = {...this.realFormData, [event.target.dataset.field] : event.detail.value};
        console.log('realformdata' + this.realFormData);        
    }*/

}