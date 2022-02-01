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
        .then((data) => {

            this.result = data;
        })
        .catch((error) => {
            console.error(error.message);
        });
    }


}