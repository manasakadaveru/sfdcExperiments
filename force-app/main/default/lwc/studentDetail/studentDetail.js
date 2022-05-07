import { LightningElement, wire } from 'lwc';
import { CurrentPageReference, NavigationMixin } from 'lightning/navigation';

import { registerListener } from 'c/pubsub';

export default class StudentDetail extends NavigationMixin(LightningElement) {

    studentId;

    @wire(CurrentPageReference) pageRef;

    connectedCallback(){
        registerListener("studentChange", this.handleStudentChange, this);
    }

    handleStudentChange(event){
        this.studentId = event.stdId;
    }

    viewRecord(){
        this[NavigationMixin.Navigate]({
            type : 'standard__recordPage',
            attributes : {
                    objectApiName : 'Contact',
                    recordId : this.studentId,
                    actionName : 'view'
            }
        });
    }

    editRecord(){
        this[NavigationMixin.Navigate]({
            type : 'standard__recordPage',
            attributes : {
                    objectApiName : 'Contact',
                    recordId : this.studentId,
                    actionName : 'edit'
            }
        });
    }

    newRecord(){
        this[NavigationMixin.Navigate]({
            type : 'standard__objectPage',
            attributes : {
                    objectApiName : 'Contact',
                    actionName : 'new'
            }
        });
    }
}