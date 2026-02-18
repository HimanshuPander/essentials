import { LightningElement } from 'lwc';

export default class ChildLifeCycleHookComponent extends LightningElement {

    constructor () {
        super();
        console.log('Constructor Called from Child Component');
    }

    connectedCallback () {
        console.log('Connected Callback called from Child Component');
    }

    renderedCallback () {
        console.log('Rendered Callback called from child Component');
    }

    disconnectedCallback () {
        console.log('Disconnected Callback called from Child Component');
    }
}