module Web
  module Sections
    module Forms
      class CadastroEnderecoForm < SitePrism::Section
        element :input_apelido_endereco, '#label'
        element :input_nome, '#firstname'
        element :input_sobrenome, '#lastname'
        element :input_cep, '#postcode'
        element :input_numero_casa, '#number'
        element :alerta_nome, '.firstnameformError'
        element :alerta_sobrenome, '.lastnameformError'
        element :alertas, '.formErrorContent'
        element :alerta_numero, '.form-fields-group .numberformError .formErrorContent'
        element :btn_cadastrar, '#btn-submit'
        element :alerta_numero, '.numberformError .formErrorContent'
        element :input_cep, '#postcode'
        element :btn_cadastrar, '#btn-submit'
      end
    end
  end
end
