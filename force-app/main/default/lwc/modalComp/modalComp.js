import { LightningElement, api } from 'lwc';

export default class ModalComp extends LightningElement {

    @api modalTitle;
    @api modalMessage;

    closeModal(){
        //using below queryselector we can get reference of div
        const divRef = this.template.querySelector('div');
        divRef.classList.add("slds-hide");

        //fire a custom event so that showModal becomes False again and when user clicks on
        //button again then popup will open
        const eventRef = new CustomEvent("close");
        this.dispatchEvent(eventRef);
    }

}