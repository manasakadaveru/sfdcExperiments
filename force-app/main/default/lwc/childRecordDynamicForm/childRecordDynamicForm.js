import { api, LightningElement } from 'lwc';

export default class ChildRecordDynamicForm extends LightningElement {
    @api getIdFromParent;
    @api objectApiName;
}