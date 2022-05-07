import { LightningElement, api } from 'lwc';

export default class Parenthook extends LightningElement {
   
    constructor(){
		 super();
         alert('parent constructor call');
    }
    connectedCallback(){
        alert('parent connected callback call');
    }
    renderedCallback(){
        alert('parent render  call back');
    }
    disconnectedCallback(){
        alert('parent disconnected  call back');
    }
}