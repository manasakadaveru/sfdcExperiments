import { LightningElement, wire } from 'lwc';

import getAllOppMethod from '@salesforce/apex/OpportunityController.getAllOpportunities';
//import getOwnOppMethod from '@salesforce/apex/OpportunityController.get';


export default class OpportunityComp extends LightningElement {
    @wire(getAllOppMethod) oppList; // oppList will get 2 built in properties returned by the framework
                                        // 1.Data which contains list of opp's returned by the apex method
                                        // 2. error which contains error info if something goes wrong 
                                        // we can access data and error using oppList.data and oppList.error
    
        /*openOppRecord(event){
            debugger;
            //console.log('Row clocked');
            let keyVal = event.currentTarget.getAttribute("data-key");
            console.log(keyVal);
            }; */
     
}