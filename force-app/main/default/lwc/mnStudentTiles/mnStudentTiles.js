import { LightningElement, api } from 'lwc';

export default class MnStudentTiles extends LightningElement {

    @api stdId;
    @api studentList;

    handleTileClick(event){
        this.stdId = event.detail.stdId;
        alert("stduentTiles received Event from studentTile :"+this.stdId);
    }
}