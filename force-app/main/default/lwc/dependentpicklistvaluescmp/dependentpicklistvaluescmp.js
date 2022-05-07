import { api, LightningElement, track } from 'lwc';
import { getPicklistValuesByRecordType } from 'lightning/uiObjectInfoApi';

export default class Dependentpicklistvaluescmp extends LightningElement {
    /*handleChange(event){
        let i;
        let checkboxes = this.template.querySelectorAll('[data-id="checkbox"]')
        for(i=0; i<checkboxes.length; i++) {
            checkboxes[i].checked = event.target.checked;
        }
    }*/
    @track openLWC=false;
    @track icChecked='false';
    @track recordFormOpen=false;

    handleClick(){
        this.openLWC = true;
        this.recordFormOpen=true;
    }

    connectedCallback(){
        this.icChecked = 'true';
    }

    handleSuccess(event) {
        console.log('onsuccess event recordEditForm',event.detail.id);
    }

    handleSubmit(event) {
        console.log('onsubmit event recordEditForm'+ event.detail.fields);
    }

    /*handleLoadComplete(event) {
        //this.icChecked = 'false';
        //event.preventDefault();   
        /*const fieldsName = event.detail.fields; 
        alert(fieldsName.isActive__c);
        this.template.querySelector('lightning-record-edit-form').submit(fieldsName);

        var record = event.detail.records;
        var fields = record[this.recordId].fields; // record['0010K000026Y******'].fields;
        const isActiveVal = fields.isActive__c.value;      
        alert(isActiveVal);
        
    }*/
    
      
    /*handleLoadComplete(event){
        var record = event.detail.records;
        var fields = record[this.recordId].fields; // record['0010K000026Y******'].fields;
        const accName = fields.Name.value;      
        alert(accName);

        event.preventDefault();       // stop the form from submitting
        const fields = event.detail.fields;
        fields.isActive__c = false;
        alert('IsActive:'+JSON.stringify(fields.isActive__c));
        this.template.querySelector('lightning-record-edit-form').submit(fields);
     }*/
    
}