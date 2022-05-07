import { LightningElement, wire, track, api } from 'lwc';

import getAllOpportunities from '@salesforce/apex/OpportunityController.getAllOpportunities';

export default class OpportWithWiredFunction extends LightningElement {
    privateProperty = 10;
    @api publicProperty = 20;

    constructor(){
        super();
        console.log("from constructor");
        console.log("privateProperty::"+this.privateProperty);
        this.publicProperty = 30;
        console.log("publicProperty::"+this.publicProperty);
    }

    connectedCallback(){
        console.log("callback from constructor");
        console.log("callback privateProperty::"+this.privateProperty);
        console.log("callback publicProperty::"+this.publicProperty);
    }

    disconnectedCallback(){
        console.log("constructor from disConnectedCallback()");
        console.log("privateProperty::"+this.privateProperty);
        console.log("publicProperty::"+this.publicProperty);
    }

    renderedCallback(){
        console.log("constructor from renderedCallback()");
        console.log("privateProperty::"+this.privateProperty);
        console.log("publicProperty::"+this.publicProperty);
    }

    @track opporTaxList = []; // @track makes a private property reactive in nature
                                //rendering - (painting) at the time compo loaded 
                                //rerendering - every time value modifies it will reflect 

    @wire(getAllOpportunities)
    wireGetAllOppMethos({data,error}){

        //alert('data : ' +JSON.stringify(data)+'\n'+'error : '+error);
       if(data){
            //iterate through data & populate info in JS object format and Push it into application
            data.forEach(opp => {
                this.opporTaxList.push({                    
                    Name: opp.Name,
                    Stage: opp.StageName,
                    Amount: opp.Amount,
                    Tax: opp.Amount * 0.10
                })                
            });
        }else if(error){

        }
    }
}