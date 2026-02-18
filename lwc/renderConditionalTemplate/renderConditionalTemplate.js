import { LightningElement } from 'lwc';

export default class RenderConditionalTemplate extends LightningElement {

    showCard = true;

    handleClick () {
        if ( this.showCard == true) {
            this.showCard = false;
        } else {
            this.showCard = true;
        }
    }
}