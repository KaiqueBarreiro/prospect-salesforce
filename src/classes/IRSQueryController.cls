/**
 * @author kaique.barreiro
 *
 *  Class that makes the connection with the LWC component and calls the IRS integration
 *
 */
public with sharing class IRSQueryController {

    class IRSQueryException extends Exception {}

    /**
     * @description method receives the cnpj component from the component and calls the service class to execute the integration, and if successful, 
     transforms it into a lead and creates the record or triggers an error message presenting the message returned from the server
     * @param  cnpj 
     */
    @AuraEnabled
    public static void searchCnpjData( String cnpj ){
        
        try {

            String payloadResponse = new IRSService().integrate ( cnpj );
            
            IRS irs = (IRS) JSON.deserialize ( payloadResponse, IRS.class );

            if ( irs.status.equals('ERROR' ) ) throw new IRSQueryException ( irs.message );

            Lead lead = new LeadTransformer ()
                        .setCNPJ ( irs.cnpj )
                        .setCompany ( irs.nome )
                        .setEmail ( irs.email )
                        .setFantasyName ( irs.fantasia )
                        .setPhone ( irs.telefone )
                        .setStatusIRS ( irs.status )
                        .setLastname ( irs.situacao )
                        .build();

            insert lead;

        } catch (Exception e) {
        
            throw new AuraHandledException ( e.getMessage() );
        
        }
        
    }

}