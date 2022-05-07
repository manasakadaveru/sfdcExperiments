import { LightningElement, wire } from 'lwc';
import getContactList from '@salesforce/apex/ContactController.getSingleContactList';

export default class ApexWireMethodToProperty extends LightningElement {
    @wire(getContactList) contacts;
}