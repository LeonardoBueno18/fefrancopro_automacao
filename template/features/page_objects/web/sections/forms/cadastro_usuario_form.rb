module Web
  module Sections
    module Forms
      class CadastroUsuarioForm < SitePrism::Section
        element :input_nome, '#firstname'
        element :input_sobrenome, '#lastname'
        element :input_telefone, '#telephone'
        element :input_cpf, '#cpf'
        element :alerta_telefone, '.telephoneformError'
        element :alerta_nome, '.firstnameformError'
        element :alerta_sobrenome, '.lastnameformError'
        element :alerta_cpf, '.cpfformError'


      end
    end
  end
end
