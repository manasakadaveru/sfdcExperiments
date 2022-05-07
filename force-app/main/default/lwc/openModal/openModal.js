import { LightningElement, track } from 'lwc';

export default class OpenModal extends LightningElement {

    @track isModalOpen = false;

    handleOpen(event){
        this.isModalOpen = true;
    }
    closeModal() {
        this.isModalOpen = false;
    }
    handleCloseButton(event){
        alert('Close');
    }
}