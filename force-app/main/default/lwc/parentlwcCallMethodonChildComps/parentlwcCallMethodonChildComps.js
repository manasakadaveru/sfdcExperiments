import { LightningElement } from 'lwc';

export default class ParentlwcCallMethodonChildComps extends LightningElement {
    handleSubmit(){
        this.template.querySelector("c-childlwc-call-methodon-child-comps").handleValueChange();
    }
}