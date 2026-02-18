import { LightningElement } from 'lwc';

export default class LifeCycleHooksComponent extends LightningElement {

    isVisible = false;

    constructor () {
        super();
        console.log('Constructor Called from Parent Component');
    }

    connectedCallback () {
        console.log('Connected Callback called from Parent Component');
    }

    renderedCallback () {
        console.log('Rendered Callback called from Parent Component');
    }

    errorCallback () {
        console.log('Error Callback called from Parent Component');
    }

    handleClick () {
        if ( this.isVisible == true) {
            this.isVisible = false;
        } else {
            this.isVisible = true;
        }
    }
}