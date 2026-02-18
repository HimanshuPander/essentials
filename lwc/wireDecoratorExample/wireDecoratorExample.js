import { LightningElement, wire } from 'lwc';
import getAccounts from '@salesforce/apex/AccountController.getAccounts';

export default class WireDecoratorExample extends LightningElement {
    accountList = [];

    @wire(getAccounts)
    getWiredAccounts (result) {
        const {error, data} = result;

        if ( data ) {
            this.accountList = data;
        } else if ( error ) {
            console.error('Error is > ' + error);
        }
    }
}