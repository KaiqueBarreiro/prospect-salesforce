/**
 * @author kaique.barreiro
 * 
 * This class is responsible for making the connection and query with the API according to the CNPJ informed
 *
 */
public class IRSProxy extends BaseProxy {

    public IRSProxy () {
        super();        
    }

    public void setup ( Integrations__mdt integration ) {
        setMethod ( integration.Method__c );
        setContentType ( JSON_CONTENT_TYPE );
        if ( String.isNotBlank(integration.AuthorizationType__c)) {
            setAuthorization ( integration.AuthorizationType__c + ' ' + integration.Token__c );
        }
    }

    /**
     * @description method overridden because the CNPJ query API is necessary to inform by parameter when calling the integration
     * @param  endpointWithParam - https://receitaws.com.br/v1/cnpj/{param}
     */
    override
    public void setEndpoint (String endpointWithParam) {

        this.httpRequest.setEndpoint( endpointWithParam );

    }
}