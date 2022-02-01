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

        gzipInfo(this.textToCompress)
        .then((data) => {

            this.result = data;
            console.log("result: " +  this.result);
        })
        .catch((error) => {
            console.error(error);
        });
    }


}