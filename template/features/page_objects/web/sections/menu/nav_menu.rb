module Web
  module Sections
    module Menu
      class NavMenu < SitePrism::Section
          element :a_visualizar_pedidos, 'li:nth-child(1) > a'
          element :a_dados_cadastrais, 'li:nth-child(2) > a'
          element :a_gerenciar_enderecos, 'li:nth-child(3) > a'
          element :a_altera_acesso, 'li:nth-child(4) > a'
      end
    end
  end
end
