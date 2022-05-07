import { api, LightningElement } from 'lwc';

export default class ReusablelwcChildComp extends LightningElement {
    @api inputLabel;

    @api checkValidity(){
        var inputCmp = this.template.querySelector(".inputCmp");
        var value = inputCmp.value;
        if(!value){
            inputCmp.setCustomValidity("Please Enter a Value");
        }else{
            inputCmp.setCustomValidity("");
        }
        inputCmp.reportValidity();
    }
}