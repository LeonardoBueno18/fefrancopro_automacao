require_relative '../sections/headers/categoria_header.rb'

module Web
  module Pages
    module Home
      class Home < SitePrism::Page
        set_url '/'
###################################################
########### Definição de elementos e sections ####
#################################################
        section :categoria_header, Web::Sections::Headers::CategoriaHeader, '#ffranco .lista_categorias'
        element :h2_destaques, '.title-boxes-owl.title > h2'
        element :input_busca, '#keywords'
        element :btn_busca, '#frmbusca > button'
        element :h1_nome_produto, '.header > h1'
        element :primeiro_produto_camisetas, 'li:nth-child(1) > div > a:nth-child(1) > div.imagem'
        element :nome_primeiro_produto, 'li:nth-child(1) > div > a:nth-child(1) > b > div'
############################################
########### Metodos de ações e cliques ####
##########################################
        def seleciona_primeiro_produto
          primeiro_produto_camisetas.gclick
        end
        def clica_btn_buscar
          btn_busca.gclick
        end
        def buscar_produtos (produto)
          input_busca.gset produto
          clica_btn_buscar
        end
        def selecionar_categoria (categoria)
          @categoria_site = Factory::Static.static_file('categorias_produtos')
          case categoria
          when @categoria_site[:acessorios]
            categoria_header.a_acessorios.gclick
          when @categoria_site[:bermuda]
            categoria_header.a_bermuda.gclick
          when @categoria_site[:bone]
            categoria_header.a_bone.gclick
          when @categoria_site[:calca]
            categoria_header.a_calca.gclick
          when @categoria_site[:camisetas]
            categoria_header.a_camisetas.gclick
          when @categoria_site[:feminina]
            categoria_header.a_feminina.gclick
          when @categoria_site[:marmiteira]
            categoria_header.a_marmiteira.gclick
          when @categoria_site[:mochila]
            categoria_header.a_mochila.gclick
          when @categoria_site[:moletom]
            categoria_header.a_moletom.gclick
          when @categoria_site[:monster]
            categoria_header.a_monster.gclick
          when @categoria_site[:regatas]
            categoria_header.a_regatas.gclick
          else
            print "\n 404 - CATEGORIA NÃO ENCONTRADA!!"
          end
        end
############################################
########### Metodos de retornos e alertas #
##########################################
        def retorna_nome_primeiro_produto
          nome_primeiro_produto.text
        end
        def retorna_nome_pesquisa
          h1_nome_produto.text
        end
      end
    end
  end
end
