import { LightningElement } from 'lwc';
import fetchAccounts from '@salesforce/apex/userInputHandler.fetchAccounts';

export default class UserInputComponent extends LightningElement {
    userInput = '';
    accounts = [];

    handleChange(event) {

        this.userInput = event.target.value;
        console.log('User Input:', this.userInput);

        fetchAccounts({ searchKey: this.userInput })
            .then(result => {
                this.accounts = result;
                console.log('Accounts:', this.accounts);
            })
            .catch(error => {
                console.error('Error fetching accounts:', error);
            });

    }
}