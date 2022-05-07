import { LightningElement, wire, track } from 'lwc';

import getAllContactsMethod from '@salesforce/apex/ContactController.getAllContacts'

export default class MnStudentBrowser extends LightningElement {

    @track studentList = [];

    @wire(getAllContactsMethod)
    wiredGetAllContactsMethod({data,error}){
        if(data){
            data.forEach(stdElement => {
                this.studentList.push({
                    Name : stdElement.FirstName+' '+stdElement.LastName,
                    Title : stdElement.Title,
                    Phone : stdElement.Phone,
                    Email : stdElement.Email,
                    PhotoURL : '/services/images/photo/00380FakePictId',
                    Id : stdElement.Id
                });
            });
        }
        else if(error){ 

        }
    }


}