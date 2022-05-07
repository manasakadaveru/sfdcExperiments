import { LightningElement, wire } from 'lwc';
import checkApexmethods from '@salesforce/apex/ApexTypesController1.checkingApexType';

export default class ApexImperativeMethodWithComplexParams1 extends LightningElement {
    listItemValue;
    stringValue;

    message;
    error;

    handleStringChange(event){
        this.stringValue = event.target.value;
    }
    handleListChange(event){
        this.listItemValue = event.target.value;
    }

    handleButtonClick(){
        let paramObj ={
            someString : this.stringValue,
            someList : []
        }
    

        for(let i=0; i<this.listItemValue; i++){
        paramObj.someList.push({
            someInnerString:this.stringValue
        });
        }
        checkApexmethods({wrapper : paramObj})
            .then((result) => {this.message = result; this.error = undefined;})
            .catch((error) => {this.error=error; this.message=undefined;})
    }
}