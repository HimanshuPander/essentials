import { LightningElement, track } from 'lwc';
import fetchAccountList from '@salesforce/apex/wiredAccountController.fetchAccountList';

export default class ComboboxComponent extends LightningElement {

    value = '';
    @track accOptions = [];

    get options(){
        return this.accOptions;
    }

    connectedCallback() {
        fetchAccountList()
        .then( data => {
            this.accOptions = data.map(( item ) => {
                return {
                    label : item.Name,
                    value : item.Id
                }
            })
        })
        .catch( error => {
            console.log(error);
        })
    }

    handleChange(event) {
        this.value = event.target.value;
    }
}