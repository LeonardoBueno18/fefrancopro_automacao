module Web
  module Sections
    module Produto
      class ProdutoCard < SitePrism::Section
        element :a_nome_produto, '.prod_title a'
        element :div_preco, '.prod_wine_club_price'
        element :span_quantidade, '.select2-selection__rendered'
        element :a_adicionar_carrinho, 'a[id^=button_cart]'

        def get_data
          {
            link: a_nome_produto['href'],
            preco: div_preco.text.delete('NÃO SÓCIO R$'),
            quantidade: span_quantidade.text
          }
        end

        def adicionar_ao_carrinho
          a_adicionar_carrinho.gclick
        end

        def buyable?
          a_adicionar_carrinho if has_a_adicionar_carrinho?
        end
      end
    end
  end
end
