
module Web
  module Pages
    module Carrinho
      class CarrinhoPage < SitePrism::Page
###################################################
########### Definição de elementos e sections ####
#################################################
        element :quantidade_carrinho, 'div.header-btn-cart > div'

############################################
########### Metodos de retornos e alertas #
##########################################
        def retornar_quantidade_carrinho
          quantidade_carrinho.greenify
          quantidade_carrinho.text
        end

############################################
########### Metodos de ações e cliques ####
##########################################

      end
    end
  end
end
