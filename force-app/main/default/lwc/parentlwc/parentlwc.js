import { LightningElement, track } from 'lwc';

export default class Parentlwc extends LightningElement {

    @track progressValue = 10;
    handleChangeProgressBar(event){
        this.progressValue = event.detail;
    }
}