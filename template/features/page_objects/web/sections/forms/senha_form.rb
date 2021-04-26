module Web
  module Sections
    module Forms
      class SenhaForm < SitePrism::Section
        element :senha_atual, '#password_current'
        element :nova_senha, '#password'
        element :nova_senha_confirma, '#confirmation'
        element :alert_nova_senha_confirma, ' li:nth-child(2) > div'
        element :alert_nova_senha, '.fields > li:nth-child(1) > div'


      end
    end
  end
end
