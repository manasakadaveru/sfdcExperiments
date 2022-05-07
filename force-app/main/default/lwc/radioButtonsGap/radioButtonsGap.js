import { LightningElement, track } from 'lwc';

export default class RadioButtonsGap extends LightningElement {
    @track aaa;
    getRadioValue(event){
        this.aaa = event.target.value;
        alert('a : '+this.aaa);
    }
}