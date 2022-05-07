import { LightningElement, wire, track } from 'lwc';
import { CurrentPageReference } from 'lightning/navigation';

import getAllContacts from '@salesforce/apex/StudentController.getAllContacts';

import {fireEvent} from 'c/pubsub';


export default class StudentBrowser extends LightningElement {
    @wire(CurrentPageReference) pageRef;

    @track studentList =[];
    selectedStudentId = '';

    @wire(getAllContacts) 
    wiredGetAllContacts({error,data}){
        if(data){

            data.forEach(stdElement => {
                this.studentList.push({
                    Name: stdElement.FirstName+''+stdElement.LastName,
                    Email: stdElement.Email,
                    Phone: stdElement.Phone,
                    PhotoUrl: '/services/images/photo/00380FakePictId',
                    Title: stdElement.Title,
                    Id: stdElement.Id
                });
            });

        }else if(error){

        }
    }

    handleStudentClick(event){
        this.selectedStudentId = event.detail.stdId;
        //alert("Received Id from Student Browser...."+this.selectedStudentId);

        //get reference of studentTilesComp using this.template.querySelector("c-student-tiles-comp");
        const tiles = this.template.querySelector('c-student-tiles-comp');
        if(tiles){
            tiles.setSelectedIdOnTiles(this.selectedStudentId);
        }

        const tables = this.template.querySelector('c-student-table');
        if(tables){
            tables.setSelectedOnTable(this.selectedStudentId);
        }

        //call fireEvent by passing this.select
        fireEvent(this.pageRef, "studentChange", {stdId : this.selectedStudentId});
    }


}