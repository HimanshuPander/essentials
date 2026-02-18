import { LightningElement } from 'lwc';

export default class CallbackFunctionComponent extends LightningElement {

    connectedCallback() {
        let output = this.calculate(10,5);
        window.alert('Output is : ' + output);
    }

    calculate ( dividend, divisor ) {
        return (dividend / divisor);
    }
}