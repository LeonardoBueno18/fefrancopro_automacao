module Web
  module Sections
    module Forms
      class CadastroForm < SitePrism::Section
        element :titulo_pagina, '.title-container > h1'
        element :btn_pf, "label[for='type_customer_f']"
        element :btn_pj, "label[for='type_customer_j']"
        element :input_primeiro_nome, '#firstname'
        element :input_sobrenome, '#lastname'
        element :btn_macho, '#gender_m'
        element :btn_femea, '#gender_f'
        element :input_nascimento, '#data_nasc'
        element :input_cpf, '#cpf'
        element :input_telefone, '#telephone'
        element :input_celular, '#cellphone'
        element :input_cep, '#postcode'
        element :input_numero_casa, '#number'
        element :input_email, '#email_address'
        element :input_senha, '#password'
        element :input_senha_confirma, '#confirmation'
        element :btn_cadastrar, '#btn-go'
        element :alerta_nome, '.firstnameformError'
        element :alerta_sobrenome, '.lastnameformError'
        element :alertas, '.formErrorContent'
        element :alerta_telefone, '.telephoneformError'
        element :input_razao_social, '#company'
        element :input_nome_fantasia, '#company_fantasia'
        element :input_cnpj, '#cnpj'
      end
    end
  end
end
