import { LightningElement, wire } from 'lwc';
import { publish, subscribe, MessageContext } from 'lightning/messageService';
import Component_Communication_Channel from '@salesforce/messageChannel/ComponentCommunicationChannel__c';
import Component_Channel from '@salesforce/messageChannel/ComponentChannel__c';

export default class ComponentB extends LightningElement {

    @wire(MessageContext)
    messageContext;

    subscribe = null;
    receivedMessage = 'No Message Received Yet. Please check back after sending a message.';

    connectedCallback() {
        if(!this.subscribe) {
            this.subscribe = subscribe(this.messageContext, Component_Communication_Channel, (payload) => {
                this.handleReceiveMessage(payload);
            })
        }
    }

    handleReceiveMessage(payload) {
        console.log('Message received in Component B > ' + payload.message);
        this.receivedMessage = payload.message;
    }

    handleClick() {
        const msgFromB = this.template.querySelector('lightning-input').value;
        const payload = { message: msgFromB };
        publish(this.messageContext, Component_Channel, payload);
    }
}