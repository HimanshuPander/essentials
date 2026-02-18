import { LightningElement, track, wire} from 'lwc';
import fetchAccountList from '@salesforce/apex/wiredAccountController.fetchAccountList';

const columns = [
    { label: 'Account Name', fieldName: 'Name'},
    { label: 'Account Industry', fieldName: 'Industry'}
];

export default class WiredAccountsComponent extends LightningElement {

    @track columns = columns;
    @track data = [];

    @wire (fetchAccountList)
    wiredAcccountList({ data, error}) {
        if( data) {
            this.data = data;
        }else if ( error ) {
            console.log(error);
        }
    }


}