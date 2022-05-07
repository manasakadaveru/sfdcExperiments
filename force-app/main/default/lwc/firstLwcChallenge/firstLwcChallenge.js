import { LightningElement } from 'lwc';

export default class FirstLwcChallenge extends LightningElement {
    todayDateTime = new Date();

    changeDatetime(){
        this.todayDateTime = new Date();
    }

    /*constructor(){
        super();
        setInterval(function(){
            this.todayDateTime = new Date();
        }.bind(this),1000);
    }*/
    constructor(){
        super();
        let thisVar = this; // acope of thisVar is through out constructor which includes callback function as well 
        setInterval(function(){
            thisVar.todayDateTime = new Date();
        }.bind(this),1000);
    }

}