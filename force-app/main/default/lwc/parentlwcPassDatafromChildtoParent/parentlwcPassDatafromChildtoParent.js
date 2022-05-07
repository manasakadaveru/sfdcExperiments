import { LightningElement, track } from 'lwc';

export default class ParentlwcPassDatafromChildtoParent extends LightningElement {
    @track progressValue=0;
    handleProgressValue(event){
        this.progressValue = event.detail;
    }
}