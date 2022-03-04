import { LightningElement } from 'lwc';
import gzipInfo from '@salesforce/apex/FunctionApex.gzipInfo';

export default class TestarFunction extends LightningElement {

    textToCompress;
    result;


    changeInputHandler(event) { 
        this.textToCompress = event.target.value;
    }

    handleClick(event) {

        const dataToSend = JSON.stringify(this.textToCompress);
        console.log('O que comprimir: ' + dataToSend);

        gzipInfo( { data: dataToSend } )
        .then((data) => {

            this.result = data;
            console.log("result: " +  this.result);
        })
        .catch((error) => {
            console.error(error);
        });
    }


}