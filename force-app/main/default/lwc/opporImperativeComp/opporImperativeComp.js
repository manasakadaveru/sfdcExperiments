import { LightningElement, track } from 'lwc';

import getAllOpportunities from '@salesforce/apex/OpportunityController.getAllOpportunities';
import getOwnOpportunities from '@salesforce/apex/OpportunityController.getOwnOpportunities';

import { showToast } from 'c/util';

export default class OpporImperativeComp extends LightningElement {
    @track opporTaxList = [];

    //constructor(){
        //super();

        OwnOpportunities(){

            showToast(this, "SUCCESS", "Loaded All Opportunities", "success");

            this.opporTaxList = [];
            //calling apex method imperatively
            getOwnOpportunities() //imperative call
            
            .then(data =>{            
                data.forEach(opp => {
                    this.opporTaxList.push({                    
                        Name: opp.Name,
                        Stage: opp.StageName,
                        Amount: opp.Amount,
                        Tax: opp.Amount * 0.10
                    })                
                });
            })
            .catch(error =>{
                alert("Error");
            })
        //}
        }

    loadOpportunities(){

        showToast(this, "SUCCESS", "Loaded All Opportunities", "success");

        this.opporTaxList = [];
        //calling apex method imperatively
        getAllOpportunities() //imperative call
        
        .then(data =>{            
            data.forEach(opp => {
                this.opporTaxList.push({                    
                    Name: opp.Name,
                    Stage: opp.StageName,
                    Amount: opp.Amount,
                    Tax: opp.Amount * 0.10
                })                
            });
        })
        .catch(error =>{
            alert("Error");
        })
    //}
    }

}