import { LightningElement, api } from 'lwc';
import gzipInfo from '@salesforce/apex/FunctionApex.gzipInfo';

export default class TestarFunction extends LightningElement {

    textToCompress;
    result;

    changeInputHandler(event) {
        this.textToCompress = event.target.value;
    }

    handleClick(event) {

        console.log('O que comprimir: ' + this.textToCompress);

        gzipInfo({

            data: this.textToCompress

        })
        .then((result) => {


            this.result = JSON.stringify(result);

            this.ready = true;
            this.error = undefined;
        })
        .catch((error) => {
            this.error = error;
            console.error(error.message);
        });
    }


}