require_relative '../sections/headers/categoria_header.rb'

module Web
  module Pages
    module Produto
      class ProdutoPage < SitePrism::Page
        set_url '/camiseta-ff-vinho-caveira-p281'
###################################################
########### Definição de elementos e sections ####
#################################################
        element :titulo_produto, '#retur'
        element :btn_comprar, "button[title='Comprar']"
        element :btn_comprar_texto, "button[title='Comprar'] span"
        element :select_tamanhos, '.attributes-group .attributes-item'
        element :tamanho_p, 'option:nth-child(2)'
        element :tamanho_m, 'option:nth-child(3)'
        element :tamanho_g, 'option:nth-child(4)'
        element :tamanho_gg, 'option:nth-child(5)'
        element :alerta_dispinibilidade, '.product-notify-availability .title'

############################################
########### Metodos de retornos e alertas #
##########################################
        def retorna_nome_produto
          titulo_produto.greenify
          titulo_produto.text
        end
        def retorna_dispinibilidade (tamanho)
          @tamanho_produto = Factory::Static.static_file('tamanho_produto')
            case tamanho
            when @tamanho_produto[:p]
              btn_comprar_texto.text
            when @tamanho_produto[:m]
              btn_comprar_texto.text
            when @tamanho_produto[:g]
              btn_comprar_texto.text
            when @tamanho_produto[:gg]
              alerta_dispinibilidade.text
            else
              print "\n 404 - TAMANHO INVÁLIDO!"
            end
        end
        def retorna_mensagens_esperadas (tamanho)
          @tamanho_produto = Factory::Static.static_file('tamanho_produto')
            case tamanho
            when @tamanho_produto[:p]
              @tamanho_produto[:disponivel]
            when @tamanho_produto[:m]
              @tamanho_produto[:disponivel]
            when @tamanho_produto[:g]
              @tamanho_produto[:disponivel]
            when @tamanho_produto[:gg]
              @tamanho_produto[:indisponivel]
            else
              print "\n 404 - TAMANHO INVÁLIDO!"
            end
        end

############################################
########### Metodos de ações e cliques ####
##########################################
        def adicionar_no_carrinho
          btn_comprar.gclick
          sleep 5
          btn_comprar.gclick
          sleep 5
        end
        def seleciona_tamanho_p
          select_tamanhos.gclick
          tamanho_p.gclick
        end
        def seleciona_tamanho_m
          select_tamanhos.gclick
          tamanho_m.gclick
        end
        def seleciona_tamanho_g
          select_tamanhos.gclick
          tamanho_g.gclick
        end
        def seleciona_tamanho_gg
          select_tamanhos.gclick
          tamanho_gg.gclick
        end
        def selecionador_de_tamanhos(tamanho)
          @tamanho_produto = Factory::Static.static_file('tamanho_produto')
          case tamanho
          when @tamanho_produto[:p]
            seleciona_tamanho_p
          when @tamanho_produto[:m]
            seleciona_tamanho_m
          when @tamanho_produto[:g]
            seleciona_tamanho_g
          when @tamanho_produto[:gg]
            seleciona_tamanho_gg
          else
            print "\n 404 - TAMANHO INVÁLIDO!"
          end
        end
      end
    end
  end
end
