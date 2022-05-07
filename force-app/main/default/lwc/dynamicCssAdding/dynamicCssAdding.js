import { LightningElement, track } from 'lwc';

export default class DynamicCssAdding extends LightningElement {

    @track changeStyle = false;
    get className(){
      //if changeStle is true, getter will return class1 else class2
        return this.changeStyle ? 'class1': 'class2';
    }
    handleChange(event){
        this.changeStyle = event.target.checked;
    }
}