import { LightningElement, api } from 'lwc';
import gzipInfo from '@salesforce/apex/FunctionApex.gzipInfo';

export default class TestarFunction extends LightningElement {

    textToCompress;
    result;

    changeInputHandler(event) {
        this.textToCompress = event.target.value;
    }

    handleClick(event) {

        console.log('CEP: ' + this.textToCompress);

        gzipInfo({

            data: this.textToCompress

        })
        .then((result) => {


            var responseObj = JSON.stringify(result);

            this.result = responseObj;
            this.uf = responseObj.uf;
            this.localidade = responseObj.localidade;
            this.bairro = responseObj.bairro;
            this.logradouro = responseObj.logradouro;
            this.ready = true;
            this.error = undefined;
        })
        .catch((error) => {
            this.error = error;
            console.error(error.message);
        });
    }


}