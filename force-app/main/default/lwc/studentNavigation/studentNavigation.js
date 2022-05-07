import { LightningElement, track, wire } from 'lwc';

import getAccountRecordsMethod from '@salesforce/apex/StudentController.getAccountRecords';

export default class StudentNavigation extends LightningElement {

    @track selectedItem = '';
    @wire(getAccountRecordsMethod) accList;

    handleSelect(event){
       this.selectedItem = event.detail.name;
       this.notifyParent();
    }

    //here we just showcasing one function can call another function 
    //notifyParent function can be called by handleSelect 
    //we can directly write this below code in handelSelect as well
    
    notifyParent(){
        const eventRef = new CustomEvent("navigation", { detail: {item: this.selectedItem}});
        this.dispatchEvent(eventRef);
    }

}