/**
 * @author kaique.barreiro
 *
 * This class is responsible for performing the configuration to perform the integration
 *
 */
public with sharing abstract class BaseProxy {

    public static final String JSON_CONTENT_TYPE = 'application/json; charset=UTF-8';

    private Http http;

    protected HttpRequest httpRequest {get;set;}
    protected HttpResponse httpResponse {get;set;}
    protected String url;
    protected String method;
    protected String token;

    public BaseProxy () {
        this.http = new Http();
        this.httpRequest = new HttpRequest();
        this.httpRequest.setTimeout(120000);
    }
    
    /* 
        Methods responsible for setting the main integration settings
    */
    virtual
    public void setBody (Object obj) {

        this.httpRequest.setBody (JSON.serialize(obj));

    }

    virtual
    public void setEndpoint (String url) {

        this.httpRequest.setEndpoint( url );

    }

    virtual
    public void setMethod (String method) {

        this.httpRequest.setMethod( method );

    }

    virtual
    public void setAuthorization (String authorizationTypePlusToken) {

        httpRequest.setHeader ( 'Authorization', authorizationTypePlusToken );

    }

    virtual
    public void setContentType (String contentType) {

        this.httpRequest.setHeader('Content-Type', contentType);

    }

    /**
     * @description send method responsible for initiating the integration call
     * @param  obj desired object to be sent
     * @return     return body
     */
    virtual
    public String send( Object obj ) {

        if ( this.httpRequest.getMethod() != 'GET' )
            setBody (obj);

        httpResponse = tryToSend (this.httpRequest);

        return httpResponse.getBody();

    }

    /**
     * @description - method that performs up to three attempts to integrate with the API
     * @param  request 
     * @return body        return server response
     */
    private HttpResponse tryToSend (HttpRequest request) {

        for (Integer i = 0 ; i < 3; i++) {

            try {

                this.httpResponse = http.send(this.httpRequest);

                break;

            } catch (CalloutException e) {

                System.debug('  --------- Error [ retry ' + i + ' ] - ' + e.getMessage());

                if (i == 2) throw e;

            }

        }

        return this.httpResponse;

    }

}