import { LightningElement } from 'lwc';
import objAccount from '@salesforce/schema/Account';
import fieldName from '@salesforce/schema/Account.Name';
import fieldSite from '@salesforce/schema/Account.Site';
import fieldAccnumber from '@salesforce/schema/Account.AccountNumber';

export default class CreateAccontRecord extends LightningElement {
    //code to create account record
    Account=objAccount;
    myfields=[fieldName,fieldSite,fieldAccnumber];
    handleSuccess(){

    }
    hanldeSubmit(){
        
    }
}