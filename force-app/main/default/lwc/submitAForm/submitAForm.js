import { LightningElement, track } from 'lwc';

export default class SubmitAForm extends LightningElement {

    @track isChecked = false;
    @track isDisabled = true;

    handleCheckbox(event){
        this.isChecked = event.target.checked;
        if(this.isChecked){
            alert('--->'+this.isChecked);
            this.isDisabled = false;
            alert('Button---->'+this.isDisabled);
        }
        else if(this.isChecked == false){
            this.isDisabled = true;
        }
    }

}