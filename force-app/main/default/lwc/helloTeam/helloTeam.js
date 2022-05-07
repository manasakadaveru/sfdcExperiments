import { LightningElement,track } from 'lwc';

export default class HelloTeam extends LightningElement {
    @track toWhome="Offshore";
    handerTOWhome(event){
        this.toWhome=event.target.value;
    }
}