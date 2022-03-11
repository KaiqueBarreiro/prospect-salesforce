/**
 * @author kaique.barreiro
 *
 * class that will transform the response from the server to a lead

 */
public with sharing class LeadTransformer {

    private Lead lead;

    public LeadTransformer () {
        this.lead = new Lead ();
    }

    public LeadTransformer setCNPJ ( String cnpj ) {
        this.lead.CNPJ__c = cnpj;
        return this;
    }

    public LeadTransformer setCompany ( String company ) {
        this.lead.Company = company;
        return this;
    }

    public LeadTransformer setFantasyName ( String fantasyName ) {
        this.lead.FantasyName__c = fantasyName;
        return this;
    }

    public LeadTransformer setStatusIRS ( String statusIRS ) {
        this.lead.StatusIRS__c = statusIRS;
        return this;
    }

    public LeadTransformer setEmail ( String email ) {
        this.lead.Email = email;
        return this;
    }

    public LeadTransformer setPhone ( String phone ) {
        this.lead.Phone = phone;
        return this;
    }

    public LeadTransformer setLastname ( String lastName ) {
        this.lead.LastName = lastName;
        return this;
    }

    public Lead build () {
        return this.lead;
    }
    
}