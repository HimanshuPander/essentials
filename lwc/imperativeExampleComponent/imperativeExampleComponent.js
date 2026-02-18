import { LightningElement } from 'lwc';
import getTopAccounts from '@salesforce/apex/AccountController.getTopAccounts';

export default class ImperativeExampleComponent extends LightningElement {
    accountList = [];
    count = 5;

    connectedCallback () {
        this.fetchAccounts();
    }

    handleChange (event) {
        let num = event.target.value;
        console.log('Value of num > ' + num);

        if ( num && ( num > 0 || num != NULL)) {
            this.count = num;
            this.fetchAccounts();
        }else if ( num == 0 || num == null) {
            this.count = 5;
            console.log('Value of Num in else if > ', this.count);
            this.fetchAccounts();
        }
    }

    fetchAccounts () {
        getTopAccounts({count: this.count}).then(result => {
            this.accountList = result;
        })
        .catch(error => {
            console.error('Error -> ', error);
        })
    }
}