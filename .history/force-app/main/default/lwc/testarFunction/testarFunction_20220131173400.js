import { LightningElement, api } from 'lwc';

export default class TestarFunction extends LightningElement {

    textToCompress;

    changeInputHandler(event) {
        this.textToCompress = event.target.value;
    }

    handleClick(event) {

        console.log('CEP: ' + this.cep);

        buscarCEP({

            cep: this.cep

        })
        .then((result) => {


            var responseObj = JSON.parse(result);

            this.ibge = responseObj.ibge;
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