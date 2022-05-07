import { LightningElement, wire, track,api } from 'lwc';
import getAllAccountWithContactsList from '@salesforce/apex/AccountContactController.getAllAccountWithContacts';
import getContactsRelatedToAccounts from '@salesforce/apex/AccountContactController.getContactsRelatedToAccounts';
//import getContactsRelatedToAccounts from '@salesforce/apex/AccountContactController.getContactsRelatedToAccounts';
export default class WrapperClassInLWC extends LightningElement {
    @track accountsWithContacts;
    @track error;
    @track showRelatedContacts = false;
    @track contactsRelateToAcc;
    @track selectedOption;
    @track checkboxValue = false;

    @track selectedbefore;

    @wire(getAllAccountWithContactsList)
    wiredAccountsWithContacts({ error, data }) {
        if (data) {
            this.accountsWithContacts = data;
            //alert('Data:'+JSON.stringify(data));
        } else if (error) {
            alert('WrapperClassLWC error'+JSON.stringify(error));
            this.error = error;
        }
    }

    /*lisfOfOptions = [{ label: '--None--', value: '--None--' }];
    value = '--None--';
    @wire(getAllAccountWithContactsList)
    wireProductNames({ error, data }) {
        if (data) {
            alert('data returned :'+JSON.stringify(data));
            this.lisfOfOptions = data.map(productInfo => {
                return {
                    label: productInfo.Name,
                    value: productInfo.Id
                };
            });
        } else if (error) {
            alert('Error in return data:'+JSON.stringify(error));
            const event = new ShowToastEvent({
                title: 'Failed',
                message: error.message,
                variant: 'error'
            });
            this.dispatchEvent(event);
        }
    }
    @track selectedObj;
    objects = [];


        @wire(getAllAccountWithContacts)
            .then(result=>{
                var i;
                
                for(i = 0; i < result.length; i++){
                    const option = {
                        label : result[i],
                        value : result[i]
                    };
                    this.objects = [...this.objects, option];
                    
                }
                //SETTING UP THE VALUE HERE.
                this.selectedObj = this.objects[0].value;
                
            })
            .catch(error => {
                this.error = error;
                console.log('Error : '+ JSON.stringify(this.error));
            })*/



    changeHandler(event) {
        const field = event.target.name;
        if (field === 'optionSelect') {
            this.selectedOption = event.target.value;
            } 
    }

    @wire(getContactsRelatedToAccounts, { accoundId: '$selectedOption'})
    wiredContactsRelatedToAccounts({error, data}) {
        if(data){
            this.showRelatedContacts=true;
            this.contactsRelateToAcc = data;
            //alert('showRelatedContacts'+this.showRelatedContacts);
            //alert('Contacts'+JSON.stringify(data));
        }else if(error){
            this.error = error;
            alert('error :'+JSON.stringify(error));
        }


    }    

    /*handleCheckbox(event){
        alert('clicked checkbox');
        const cbField = event.target.name;
        const type = event.target.type;
        const name = event.target.name;
        let value = event.target.value;
        if(event.target.type === 'checkbox' || name === 'options'){
            value = event.target.checked;
            this.checkboxValue = this.value;
            alert('value'+this.checkboxValue);
        }        
    }*/

    @track abc;

    onCheckBoxClick(event)
    {
        
        const selectedValChk = event.target.checked;
        const selectedInput = event.target.value;
        alert(' onCheckBoxClick value'+selectedInput);
        alert('value'+selectedValChk);

         

        if(this.contactsRelateToAcc) {
            if(selectedInput!=='' || selectedInput!== undefined){
            this.contactsRelateToAcc.forEach(function(option){
                if(option.label === selectedInput) {
                    this.selectedbefore = selectedInput;
                    alert('selectedbefore : '+this.selectedbefore);
                    option.checkboxValue = selectedValChk;
                }
            });
            }
            else{
                this.contactsRelateToAcc.forEach(function(option){
                        option.checkboxValue = false;
                });
            }
        }
    }
    @track selected;
    radioValuChange(event){
        this.selected = this.selectedbefore;
        radioValue
        alert('radio value on button :'+this.selectedbefore);
    }

    /*handleAddButton(){
        alert('Entered into handleAdd');
        //alert('handleAdd contID value'+selectedInput);
        alert('abc'+this.abc);
    }*/

    @track aaa;
    getRadioValue(event){
        this.aaa = event.target.value;
        alert('a : '+this.aaa);
    }

}