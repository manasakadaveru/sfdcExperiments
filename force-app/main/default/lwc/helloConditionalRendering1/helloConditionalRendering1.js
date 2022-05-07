import { LightningElement } from 'lwc';

export default class HelloConditionalRendering1 extends LightningElement {
    visibilityOfDetails;

    handleChange(event){
        this.visibilityOfDetails = event.target.checked;
    }
}