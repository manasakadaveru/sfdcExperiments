import { LightningElement } from 'lwc';

export default class Childhooks extends LightningElement {
    constructor(){
        super();
        alert('child constructor call');
    }
    connectedCallback(){
        alert('child connected callback');
    }
    renderedCallback(){
        alert('child render callback');
    }
 
}