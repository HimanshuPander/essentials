import { LightningElement, api } from 'lwc';

export default class ApiChildComponent extends LightningElement {

    @api childProperty1;
    @api childProperty2;

    @api handleEmptyProperty() {
        this.childProperty2 = '';
    }

    handleClick() {
        const value = this.template.querySelector('lightning-input').value;
        console.log('Selected Value > ', value);
        this.dispatchEvent(new CustomEvent('send', { detail: value, bubbles: true, composed: true}));
    }
}