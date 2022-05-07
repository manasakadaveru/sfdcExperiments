import { LightningElement, track, wire, api } from 'lwc';

export default class FirstExample extends LightningElement {

    greeting = '1234';

    greetingHandler(event){
        abc = 2;
        this.greeting = "08765";
    }    
    varLetConstHandler(){
        for(const i = 0; i< 3; i++){
            alert('inside the block'+i); // 0 1 2 
        }
        alert('outside the block'+i); // nothing
    }

    //Var -> can be updated / redeclared / accessed 
    //LEt -> Can be updated / Redecalred within the scope / outside X
    //Const -> Neither up Nor Re / outside X

}