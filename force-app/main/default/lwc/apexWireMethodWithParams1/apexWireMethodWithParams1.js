import { LightningElement, wire } from 'lwc';
import findContactsmethod from '@salesforce/apex/ContactController.findContacts';

const DELAY = 300;

export default class ApexWireMethodWithParams1 extends LightningElement {

    searchKey='';

    @wire(findContactsmethod, {searchKey1 : '$searchKey'}) contacts;
    
    handleKey(event){ 
        window.clearTimeout(this.delayTimeOut);
        const searchKey2 =event.target.value;
        this.delayTimeOut = setTimeout(()=> {this.searchKey=searchKey2;}, DELAY);
    }
}