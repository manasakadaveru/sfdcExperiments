import { LightningElement, api } from 'lwc';

export default class ButtonInLwc extends LightningElement {
    @api option;
    @api selected;

    handleAddButton(event) {
        console.log('fire event to parent');
        this.progressValue = event.target.value;
        // Creates the event with the data.
        const selectedEvent = new CustomEvent("radiovaluechange", {
          detail: this.radioValuechange
        });
    
        // Dispatches the event.
        this.dispatchEvent(selectedEvent);
    }

    get isDisabled() {
        if (this.option == this.selected) {
            return false;
        }
        return true;
    }
}