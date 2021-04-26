
module Web
  module Pages
    module Carrinho
      class CarrinhoPage < SitePrism::Page
###################################################
########### Definição de elementos e sections ####
#################################################
        element :quantidade_carrinho, 'div.header-btn-cart > div'
        element :btn_acessa_carrinho, 'div.header-btn-cart > a'
        element :btn_remover_produto, '.cart-remove-item'
        element :span_carrinho_vazio, '.empty-cart .message'
        element :input_cep, '#cep'
        element :btn_economico, 'input[value="mandae_economico"]'
        element :btn_realizar_pedido, 'div:nth-child(3) .btn-primary'
        element :div_titulo_endereco, '.shipping-address .topic'
############################################
########### Metodos de retornos e alertas #
##########################################
        def retornar_quantidade_carrinho
          quantidade_carrinho.greenify
          quantidade_carrinho.text
        end
        def retorna_carrinho_vazio
          span_carrinho_vazio.greenify
          span_carrinho_vazio.text
        end
        def retorna_titulo_endereco
          div_titulo_endereco.greenify
          div_titulo_endereco.text
        end
        def retorna_texto_esperado
          @texto_esperado[:destino]
        end
############################################
########### Metodos de ações e cliques ####
##########################################
        def clicar_btn_remover_produto
          btn_remover_produto.gclick
        end
        def clica_btn_acessa_carrinho
          btn_acessa_carrinho.gclick
        end
        def clicar_btn_realizar_pedido
          btn_realizar_pedido.gclick
        end
        def finalizar_compra
          @texto_esperado = Factory::Static.static_file('texto_esperado')
          @endereco = Factory::Dynamic.address
          input_cep.gset @endereco[:cep]
          btn_economico.gclick
          clicar_btn_realizar_pedido
        end
      end
    end
  end
end
