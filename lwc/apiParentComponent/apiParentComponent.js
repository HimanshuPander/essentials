import { LightningElement } from 'lwc';

export default class ApiParentComponent extends LightningElement {

    nameChild = '';

    // Method to be called by clicking of a button which sets the property of child Component with value of input field in this component.
    handleClick() {
        console.log('Handle Click called!');
        let inputValue = this.template.querySelector('lightning-input').value;
        console.log('Value of Input > ', inputValue);
        this.template.querySelector('c-api-child-component').childProperty2 = inputValue;
    }

    handleReset() {
        console.log('Child Method Called!');
        this.template.querySelector('c-api-child-component').handleEmptyProperty();
        this.template.querySelector('lightning-input').value = '';
    }

    handleReceive(event) {
        console.log('Parameter received in Parent Component > ', event.detail);
        this.nameChild = event.detail;
    }
}