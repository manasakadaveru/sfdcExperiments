import { api, LightningElement } from 'lwc';

export default class ParentRecordDynamicForm extends LightningElement {
    @api recordId;
    @api objectApiName;
}