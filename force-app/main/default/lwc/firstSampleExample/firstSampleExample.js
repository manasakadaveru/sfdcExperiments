import { LightningElement, track } from 'lwc';

export default class FirstSampleExample extends LightningElement {
    @track name;
    changeHandler(event){
        this.name=event.target.value;
    }
}