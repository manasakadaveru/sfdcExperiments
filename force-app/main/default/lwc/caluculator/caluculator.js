import { LightningElement, api } from 'lwc';

export default class Caluculator extends LightningElement {
    @api firstNumber = 0;    //these two are privaare properties
    @api secondNumber = 0; //@api along with isExposed=fasle then it is public property
                  //@api along with isExposed=true then it is global property
    result;//the default value of a property is undefined

    //Handle DOM events in order to move values from Markup to JS bcz LWC only have 1 -way binding

    //defining on change events
    onFirstNumChange(event){
        this.firstNumber =  parseInt(event.target.value, 0);
    }
    onSecondNumChange(event){
        this.secondNumber = parseInt(event.target.value, 0);
    }

    add(){
            //we must refer properties using this
            this.result = this.firstNumber + this.secondNumber;
    }
    sub(){
            this.result = this.firstNumber - this.secondNumber;
    }
    mult(){
            this.result = this.firstNumber * this.secondNumber;
    }
    div(){
            this.result = this.firstNumber / this.secondNumber;
    }
}