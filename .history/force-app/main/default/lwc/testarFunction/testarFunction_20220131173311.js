import { LightningElement } from 'lwc';

export default class TestarFunction extends LightningElement {

    var textToCompress;

    changeInputHandler(event) {
        this.textToCompress = event.target.value;
    }

}