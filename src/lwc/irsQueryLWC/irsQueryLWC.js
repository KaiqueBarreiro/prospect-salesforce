import { LightningElement, track  } from 'lwc';
import searchCnpjData from '@salesforce/apex/IRSQueryController.searchCnpjData';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class IrsQueryLWC extends LightningElement {

    @track cnpj;
    @track loading = false;

    cnpjChange(event) {
        this.cnpj= event.target.value;
    }

    handleClick(event) {
        
        this.loading = true;
        
        if ( this.cnpj.includes ('.') || this.cnpj.includes ('/') || this.cnpj.includes ('-') ) {
            console.log('include pontuação');
            this.loading = false;
            this.showNotification ( 'Error', 'Inform CNPJ without punctuation!', 'error' );
            return;
        }

        if ( this.cnpj.length != 14 ) {
            this.loading = false;
            this.showNotification ( 'Error', 'CNPJ must be informed with 14 characters!', 'error' );
            return;
        }
        
        searchCnpjData({cnpj: this.cnpj})
        .then(result => {
            this.loading = false;
            this.showNotification ( 'Success', 'CNPJ successfully consulted and Lead created!', 'success' );
        })
        .catch(error => {
            console.log(JSON.stringify(error))
            this.loading = false;
            this.showNotification ( 'Error', 'It was not possible to consult the CNPJ!' , 'error' );
        });
    }

    showNotification ( title, message, variant ) {
        
        const evt = new ShowToastEvent({
            title: title,
            message: message,
            variant: variant,
        });
        this.dispatchEvent(evt);
    
    }

}