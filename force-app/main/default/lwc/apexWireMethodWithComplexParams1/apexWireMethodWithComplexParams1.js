import { LightningElement, wire } from 'lwc';
import apexTypesMethod from '@salesforce/apex/ApexTypesController1.checkingApexType';

export default class ApexWireMethodWithComplexParams1 extends LightningElement {
    
    stringValue = '';
    listValue;

    parameterObj= {
        someString : this.stringValue,
        someList : []
    };

    @wire(apexTypesMethod, {wrapper : '$parameterObj'})  paramResp;

    handleStringChange(event){ 
        this.parameterObj ={ ...this.parameterObj, someString :(this.stringValue = event.target.value)};
    }
    handleListChange(event){
        const someList = [];
        for(let i=0; i<event.target.value; i++){
            someList.push({someInnerString: this.someString});
        }
        this.parameterObj ={ ...this.parameterObj, someList };
    }
}