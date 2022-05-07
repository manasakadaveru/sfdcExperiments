import { LightningElement, api } from 'lwc';

export default class StudentTile extends LightningElement {

    @api stdId;
    //applyCss = 'tile'; // we no need to make it reactive 

    get tileSelected(){
        console.log("get selected method calling..");
        return (this.student.Id===this.stdId) ? "tile selected" : "tile" ;
    }

    @api student = {
        Name: 'Manasa',
        Email: 'manasak@gmail.com',
        Phone: '0932748621',
        PhotoUrl: '/services/images/photo/00380FakePictId',
        Title: 'Developer',
        Id: '01'
    };

    handleHighlightClick(){
        //alert("You have selected :"+this.student.Id);

        const eventRef = new CustomEvent("tileclick",{ bubbles:true, composed:true, detail: {stdId: this.student.Id } });
        this.dispatchEvent(eventRef);
    }
}