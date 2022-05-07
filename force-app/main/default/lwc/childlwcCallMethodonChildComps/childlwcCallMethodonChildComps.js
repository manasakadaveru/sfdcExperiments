import { api, LightningElement, track } from 'lwc';

export default class ChildlwcCallMethodonChildComps extends LightningElement {
    @track value='Manasa';
    @api handleValueChange() {
        this.value='Kadaveru';
      }
}