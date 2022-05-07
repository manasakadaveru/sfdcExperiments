import { LightningElement, api } from 'lwc';

export default class ChildlwcPassDatafromChildtoParent extends LightningElement {
    @api progressValue;

    handleChnage(event){
        this.progressValue = event.target.value;
        const selectedEvent = CustomEvent("progressvaluechange", {detail : this.progressValue});
        this.dispatchEvent(selectedEvent);
    }
}