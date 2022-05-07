import { LightningElement, api } from 'lwc';

export default class StudentTable extends LightningElement {
     @api studentList;
     previousRow;
     @api stdId;

     renderedCallback(){
          this.setSelectedOnTable(this.stdId);
     }

     @api setSelectedOnTable(stdId){
          if(this.previousRow){
               this.previousRow.classList.remove("slds-is-selected");
          }

          const allTablerows = this.template.querySelectorAll('tr');
          for(let i=0; i<allTablerows.length; i++){
               let currentTableRow = allTablerows[i];
               if(stdId===currentTableRow.getAttribute("data-id")){
                    currentTableRow.classList.add("slds-is-selected");
                    this.previousRow = currentTableRow;
                    break;
               }
          }
     }

     handleRowClick(event){

          if(this.previousRow){
               this.previousRow.classList.remove("slds-is-selected");
          }

          const stdId = event.currentTarget.getAttribute("data-id");
          const currentRow = event.currentTarget;
          currentRow.classList.add("slds-is-selected"); //classList.add() and classList.remove() for applying and removing CSS
          this.previousRow = currentRow;
          //alert("you have clicked row :" +stdId);
          //Here we gonna create a custom event and pass StdId to Student Browser (Child to Parent)

          const eventRef = new CustomEvent("tableclick",{detail: {stdId} });
          this.dispatchEvent(eventRef);
     }
}