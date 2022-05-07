import { LightningElement, track } from 'lwc';
import myResource from '@salesforce/resourceUrl/myBagaBeachPhoto';
export default class StaticResourceImageExample extends LightningElement {
    @track showImage=false;
    beachWibes = myResource;

    handleClick(event){
        this.showImage=true;
    }

}