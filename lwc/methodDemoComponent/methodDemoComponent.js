import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';


export default class MethodDemoComponent extends LightningElement {
    

    handleClick() {
        const inputTxt = this.template.querySelector('lightning-input').value;

        if(inputTxt) {
            this.showToast(inputTxt);
        }
    }

    showToast(title) {
        this.dispatchEvent(new ShowToastEvent({
            title: title,
            message: 'This is a toast message.',
            variant: 'success'
        }));
    }
}