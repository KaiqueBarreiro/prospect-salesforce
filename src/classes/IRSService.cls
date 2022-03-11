/**
 * @author kaique.barreiro
 *
 * Class responsible for performing the service with the API calling the IRSProxy class responsible for connecting the IRS server (Inland Revenue)
 *
 */
public with sharing class IRSService {

    public Integrations__mdt integration {get;set;}
    
    private IRSProxy proxy;
    
    public IRSService () {

        proxy = new IRSProxy();

        this.integration = Integrations__mdt.getInstance ( 'IRS' );

        proxy.setup( integration );

    }

    /**
     * @description method that will call the proxy to make the connection with the IRS server and return the response from the same
     * @param  cnpj 
     * @return server response
     */
    public String integrate ( String cnpj ) {

        proxy.setEndpoint ( integration.Endpoint__c + '/' + cnpj );

        return proxy.send ( null ); 

    }

}