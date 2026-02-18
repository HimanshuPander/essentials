import { LightningElement, track } from 'lwc';
import fetchAccountList from '@salesforce/apex/wiredAccountController.fetchAccountList';

const columns = [ 
    { label: 'Account Name', fieldName: 'Name'},
    { label: 'Industry', fieldName: 'Industry' }
]

export default class ImperativeAccountsComponent extends LightningElement {

    @track columns = columns;
    @track data = [];


    connectedCallback() {
        fetchAccountList()
        .then(result => {
            this.data = result;
        })
        .catch(error => {
            console.log(error);
        })
    }
}