import { LightningElement } from 'lwc';

export default class HelloExpressions1 extends LightningElement {
    firstName = '';
    middleName = '';
    lastName = '';

    handleChange(event) {
        const field = event.target.name;
        if(field === 'firstName'){
            this.firstName = event.target.value;
        }
        else if(field === 'middleName'){
            this.middleName = event.target.value;
        }
        else if(field === 'lastName'){
            this.lastName = event.target.value;
        }
    }
    get UppercasedFullName(){
        return `${this.firstName} ${this.middleName} ${this.lastName}`.trim();
    }
    /*get UppercasedFullName1(){
        return `${this.middleName}`.trim().toLowerCase();
    }*/
}