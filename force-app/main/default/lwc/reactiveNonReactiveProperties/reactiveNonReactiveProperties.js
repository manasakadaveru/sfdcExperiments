import { LightningElement, track, api } from 'lwc';

export default class ReactiveNonReactiveProperties extends LightningElement {

    @track trackProperty = "Initialized Track Value";
    @api apiProperty = "Initialized API Value";
    nonReactiveProperty = "Initialized Non-Reactive Value";

    handleButtonClick(){
        var trackProperty = "Initialized Track Value Changed";
        this.apiProperty = "Initialized API Value Changed";
        this.nonReactiveProperty = "Initialized Non-Reactive Value Changed";
    }

}