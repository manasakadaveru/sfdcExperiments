import { LightningElement, track } from 'lwc';

export default class SldsGRidExample extends LightningElement {

    @track inputVal;
    @track isSelected;
    //errormessage = 

    handleChange(event){
        this.inputVal = event.target.value;
    }
    handleSelected(event){
        alert('--->'+event.target.checked);
    }
    handleSaveButton(event){
        var inputMember = this.template.querySelector(".inputMember"); 
        var value = inputMember.value;
        if(!value){
            inputMember.setCustomValidity("Please Choose Member Value");
        }else{
            inputMember.setCustomValidity("");
        }
        inputMember.reportValidity();

    }
}