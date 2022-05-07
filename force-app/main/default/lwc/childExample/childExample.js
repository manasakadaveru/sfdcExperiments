import { LightningElement, api, track, wire } from 'lwc';

export default class ChildExample extends LightningElement {

    @api reactiveApi = '    react value';
    @track reactiveTrack = '   react Track';
    nonReactiveVariable = '    Non reactive Var';

    decoratorHandler(){
        this.reactiveApi = '   New react  API value';
        this.reactiveTrack = '   New react  Track value';
        this.nonReactiveVariable = '   New NON- react  value';
    }

}