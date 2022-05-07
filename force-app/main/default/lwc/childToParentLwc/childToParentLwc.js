import { LightningElement, api } from 'lwc';

export default class ChildToParentLwc extends LightningElement {

    @api inputNumberValue;

    handleChane(event){
        this.inputNumberValue = event.target.value;

        // how to create the Custom Events ?

        const childToParentEvent = new CustomEvent("changeprogressbar",{
            detail : this.inputNumberValue
        });

        // Dispatch the Event

        this.dispatchEvent(childToParentEvent);
    }

}