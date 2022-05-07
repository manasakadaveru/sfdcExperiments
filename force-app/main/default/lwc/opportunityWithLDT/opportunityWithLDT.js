import { LightningElement, wire, track } from 'lwc';
import { deleteRecord } from 'lightning/uiRecordApi';
import { refreshApex } from '@salesforce/apex';
import { showToast } from 'c/util';

import getAllOppMethod from '@salesforce/apex/OpportunityController.getAllOpportunities';

//Writing JSOn object data into one const variable and we can reuse it
//if we want to call this data from Markup we have to assign COLS to one property 
//bcz markuop only access properties from Js
const COLS = [
    { label : 'Name', fieldName : 'Name', type : 'text' },
    { label : 'Stage', fieldName : 'StageName', type : 'text' },
    { label : 'Amount', fieldName : 'Amount', type : 'currency' }
];

export default class OpportunityWithLDT extends LightningElement {

    showModal = false;

    oppCols = COLS; //herealso we can define above JSOn format objects data 
    oppList = []; //why it is list? bcz if we want to delete any reocrds then 
                    //we have to make all records refresh once again.. like Array empty before display
    oppId = ''; //to delete 
     _wiredList;

    @wire(getAllOppMethod) 
    wiredGetAllOppMethos(arg){
        this._wiredList = arg;
        this.oppList = [];
        if(arg.data){
            this.oppList = arg.data;
        }
    }

    handleRowSelection(event){
        console.log("handleRowSelection");
            const selectedRows = event.detail.selectedRows;
            //alert("selected rowa==="+selectedRows);
            if(selectedRows.length>0){
                this.oppId = selectedRows[0].Id;
            }            
    }

    handleDelete(){
        console.log("handleDelete");
        deleteRecord(this.oppId)  //Imperative Call
        .then( ()=>{
            showToast(this, "SUCCESS", "Deleted Record successfully"+this.oppId, "success");
            refreshApex(this._wiredList);    //we may face an error with LDT
        })
        .catch( ()=>{
            showToast(this, "FAILURE", "Deleted Record successfully"+this.oppId, "error");
        })
    }

    displayModal(){ //DOM event from markup
        this.showModal = true;
    }

    handleClose(){ //Custom Event Handler first defined in modalComp(child)
        this.showModal = false;
    }

    
}