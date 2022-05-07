import { LightningElement, api } from 'lwc';

export default class ChildRecordTwoWayBinding extends LightningElement {

    @api gettingIdFromParent; 
    @api objectApiName;

}

//api , track, wire - decorators