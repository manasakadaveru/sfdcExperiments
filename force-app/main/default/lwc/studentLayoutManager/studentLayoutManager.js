import { LightningElement, track } from 'lwc';

export default class StudentLayoutManager extends LightningElement {

    @track selectedItemOnStudentNavigation;

    handleStudentNavigation(event){
        this.selectedItemOnStudentNavigation = event.detail.item;
        //alert("we are on student navigation== "+this.selectedItemOnStudentNavigation);
    }    

    get browserSelected(){
        return this.selectedItemOnStudentNavigation === "students";
    }

    get caseReports(){
        return this.selectedItemOnStudentNavigation === "casereports";
    }

    get opportunityGraphs(){
        return this.selectedItemOnStudentNavigation === "opportunitygraphs";
    }
}