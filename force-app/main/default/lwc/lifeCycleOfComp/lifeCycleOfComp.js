import { LightningElement } from 'lwc';

export default class LifeCycleOfComp extends LightningElement {

    hasRendered;

    constructor(){
        super();
        alert('parent constructor call');
    }
    connectedCallback(){
        alert('parent connected callback call');
    }
    renderedCallback(){
        alert('parent render  call back');
        this.hasRendered = true;
    }
    disconnectedCallback(){
        alert('parent disconnected  call back');
    }
    

}