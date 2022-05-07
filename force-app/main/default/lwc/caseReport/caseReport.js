import { LightningElement, wire, track } from 'lwc';

import getCaseRecordsMethod from '@salesforce/apex/StudentController.getCaseRecords';

const COLS = [
    {label : 'Case Number', fieldName : 'CaseNumber', type : 'text'},
    {label : 'Status', fieldName : 'Status', type : 'text'},
    {label : 'Closed Date', fieldName : 'CosedDate', type : 'date'},
    {label : 'Priority', fieldName : 'Priority', type : 'text'},
    {label : 'Origin', fieldName : 'Origin', type : 'text'}

];


export default class CaseReport extends LightningElement {

    @wire(getCaseRecordsMethod) caseList;
    @track caseId =''; //just to be on save side we are using track here though caseId is primitve
    colums = COLS;

    handleRowSelection(event){
        console.log("handleRowSelection");
            const selectedRows = event.detail.selectedRows;
            //alert("selected rowa==="+selectedRows);
            if(selectedRows.length>0){
                this.caseId = selectedRows[0].Id;
            }            
    }
}