import { LightningElement } from 'lwc';

export default class ReusablelwcParentComp extends LightningElement {
    handleClick(){
        this.template.querySelectorAll("c-reusablelwc-child-comp")
        .forEach(element => {
            element.checkValidity();    
        });
    }
}