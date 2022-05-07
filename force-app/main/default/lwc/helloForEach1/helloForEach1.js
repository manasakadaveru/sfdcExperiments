import { LightningElement } from 'lwc';

export default class HelloForEach1 extends LightningElement {
    contacts =[
        {
            id:'01',
            name:'Manasa',
            role:'ASE'
        },
        {
            id:'02',
            name:'Praveen',
            role:'SSE'
        },
        {
            id:'03',
            name:'chinni',
            role:'SE'
        }
    ];
}