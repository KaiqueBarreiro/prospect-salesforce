/**
 * @author kaique.barreiro 
 *
 * API integration return object class (Receita Federal)

 */
public with sharing class IRS {

    public String status {get;set;}
    public String message {get;set;}
    public Datetime ultima_atualizacao {get;set;}
    public String cnpj {get;set;}
    public String tipo {get;set;}
    public String porte {get;set;}
    public String nome {get;set;}
    public String fantasia{get;set;}
    public String abertura{get;set;}
    public List<MainActivity> atividade_principal {get;set;}
    public List<SecondaryActivities> atividades_secundarias {get;set;}
    public String natureza_juridica {get;set;}
    public String logradouro {get;set;}
    public String numero {get;set;}
    public String complemento {get;set;}
    public String cep {get;set;}
    public String bairro {get;set;}
    public String municipio {get;set;}
    public String uf {get;set;}
    public String email {get;set;}
    public String telefone {get;set;}
    public String efr {get;set;}
    public String situacao {get;set;}
    public String data_situacao {get;set;}
    public String motivo_situacao {get;set;}
    public String situacao_especial {get;set;}
    public String data_situacao_especial {get;set;}
    public String capital_social {get;set;}
    public List<QSA> qsa {get;set;}
    public Billing billing {get;set;}

    class MainActivity {
        public String code {get;set;}
        public String text {get;set;}
    }

    class SecondaryActivities {
        public String code {get;set;}
        public String text {get;set;}
    }

    class QSA {
        public String nome {get;set;}
        public String qual {get;set;}
        public String pais_origem {get;set;}
        public String nome_rep_legal {get;set;}
        public String qual_rep_legal {get;set;}
    }

    class Billing {
        public Boolean free {get;set;}
        public Boolean database {get;set;}
    }

}