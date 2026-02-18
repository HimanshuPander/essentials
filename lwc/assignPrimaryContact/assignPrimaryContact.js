import { LightningElement, track, api } from 'lwc';
import fetchContacts from '@salesforce/apex/AssignPrimaryContact.fetchContacts';
import assignPrimaryContactToAccount from '@salesforce/apex/AssignPrimaryContact.assignPrimaryContactToAccount';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { NavigationMixin } from 'lightning/navigation';

const actions = [
    { label: 'Assign', name: 'assign' },
    { label: 'View', name: 'view'}
];

 const COLUMNS = [
    { label: 'First Name', fieldName: 'FirstName'},
    { label: 'Title', fieldName: 'Title'},
    {
        type: 'action',
        typeAttributes: { rowActions: actions },
    }
];

export default class AssignPrimaryContact extends NavigationMixin(LightningElement) {

    @track showContacts = 'Show Contacts';
    isVisible = false;
    @api recordId;

    columns = COLUMNS;

    @track data = [];
    contactData;

    connectedCallback(){
        console.log('Record Id > ' + this.recordId);

        // Code for fetching contacts of the particular account
        fetchContacts( { accountId : this.recordId })
        .then( result => {
            this.data = result;
        })
        .catch( error => {
            console.log('Error > ' + error);
        })
    }

    handleClick ( event ) {
        let btnLabel = event.target.label;

        if( btnLabel === 'Show Contacts'){
            this.showContacts = 'Hide Contacts';
            this.isVisible = true;
        } else if (btnLabel === 'Hide Contacts'){
            this.showContacts = 'Show Contacts';
            this.isVisible = false;
        }
    }

    handleRowAction( event) {
        let actionName = event.detail.action.name;
        let row = event.detail.row;

        console.log(' Action Name > ' + actionName);

        console.log(' Handle Row Action Method called!');

        switch (actionName) {
            case 'assign':
                this.handleAssign(row);
                break;
            case 'view':
                this.handleView(row);
                break;
            default:
                break;
        }
    }

    handleAssign( row ) {
        const selectedRow = row;

        assignPrimaryContactToAccount( { contactId: selectedRow.Id })
        .then( result => {
        })
        .catch( error => {
            //console.log('Error > ' + error);
        })

        this.showSuccessToast();
        window.location.reload; 
    }

    showSuccessToast() {
        const event = new ShowToastEvent( {
            title: 'Record Updated!',
            message: 'Primary Contact assigned Successfully.',
            variant: 'success'
        });
        this.dispatchEvent( event );
    }

    handleView ( row ) {
        const contactRecord = row;

        this[NavigationMixin.Navigate]({
            type: 'standard_recordPage',
            attributes: {
                recordId: contactRecord.Id,
                actionName: 'view'
            }
        })
    }

}