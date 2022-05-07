import { LightningElement, api } from 'lwc';

export default class MnStudentTile extends LightningElement {

    @api stdId;

    //this will give pointer (cursor action) when tile selected
    /*get tileSelected(){
        console.log("TileSelected through get selected getter method:")
        return (this.student.Id === this.stdId) ? "tile slected" : "tile";
    }*/

    @api student = {
        Name: 'Manasa',
        Email: 'manasak@gmail.com',
        Phone: '0932748621',
        PhotoUrl: '/services/images/photo/00380FakePictId',
        Title: 'Developer',
        Id: '01'
    };  

    //first click on tile and then tiles so ChildComp(Tile) 
    //creates custom event to communicate with ParentComp(Tiles)

    handleHighlightClick(){
        alert("Tile selected on tileComp:: "+this.student.Id);

        const eventRef = new CustomEvent("tileclick", { detail: { stdId : this.student.Id } });
        this.dispatchEvent(eventRef);
        
    }
}