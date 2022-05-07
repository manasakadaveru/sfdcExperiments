import { LightningElement, api } from 'lwc';

export default class StudentTilesComp extends LightningElement {
    @api studentList;
    @api stdId;

    handleTileClick(event){
        this.stdId = event.detail.stdId;
        //alert("StudentTiles received event from StudentTile :"+this.stdId);
    }

    @api setSelectedIdOnTiles(selectedStdId){
        this.stdId = selectedStdId;
    }
}