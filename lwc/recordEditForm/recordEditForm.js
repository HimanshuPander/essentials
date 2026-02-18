import { LightningElement } from 'lwc';
import ShowToastEvent from 'lightning/platformShowToastEvent';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import TYPE_FIELD from '@salesforce/schema/Account.Type';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';

export default class RecordEditForm extends LightningElement {

    objectApiName = ACCOUNT_OBJECT;
    nameField = NAME_FIELD;
    typeField = TYPE_FIELD;
    phoneField = PHONE_FIELD;

    recordId = 'Will be populated once Account created!';

    handleSuccess(event) {

        this.recordId = event.detail.id;
        //console.log('Record Id > ' + this.recordId);

        const evt = new ShowToastEvent({
            title: 'Success',
            message: 'Account created Successfully!',
            variant: 'success'
        });
        this.dispatchEvent(evt);
    }
}