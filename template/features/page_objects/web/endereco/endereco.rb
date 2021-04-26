require_relative '../sections/menu/nav_menu.rb'
require_relative '../sections/forms/cadastro_endereco_form.rb'
module Web
  module Pages
    module Endereco
      class EnderecoPage < SitePrism::Page
###################################################
########### Definição de elementos e sections ####
#################################################

        section :nav_menu, Web::Sections::Menu::NavMenu, '.nav-menu'
        section :form_endereco, Web::Sections::Forms::CadastroEnderecoForm, '#ck-address'
        element :btn_remover_segundo_endereco, 'ul > li:nth-child(2) #btn-remove > i'
        element :nome_endereco, 'div.customer-address-list > ul > li:nth-child(1) > div.address > span.name'
        element :alert_sucesso, '.alert-success  > span'

############################################
########### Metodos de retornos e alertas #
##########################################


        def retorna_alerta_numero
          form_endereco.alerta_numero.greenify
          form_endereco.alerta_numero.text
        end
        def remover_segundo_endereco
          btn_remover_segundo_endereco.gclick
        end

        def retorna_alerta_nome
          form_endereco.alerta_nome.text
        end
        def retorna_alerta_sobrenome
          form_endereco.alerta_sobrenome.text
        end
        def retorna_nome_endereco
          nome_endereco.text
        end

        def retorna_comparativo_nome_endereco
          @usuario[:nome]
        end

        def retorna_alerta_sucesso
          alert_sucesso.text
        end

        def retorna_erros_cadastrais_endereco (tipo)
          @tipo_erro = Factory::Static.static_file('cadastro_tipos_erro')
          case tipo
          when @tipo_erro[:campos_obrigatorios]
            retorna_alerta_numero
          when @tipo_erro[:nome_invalido]
            retorna_alerta_nome
          when @tipo_erro[:sobrenome_invalido]
            retorna_alerta_sobrenome
          else
            print "\n 404 - TIPO DE ERRO NÃO ENCONTRADO!"
          end
        end

        def retorna_texto_esperado
          @texto_esperado = Factory::Static.static_file('texto_esperado')
          @texto_esperado[:sucesso]
        end
############################################
########### Metodos de ações e cliques ####
##########################################
        def clica_btn_cadastrar
          form_endereco.btn_cadastrar.gclick
        end

        def adicionar_novo_endereco
          @usuario = Factory::Dynamic.user
          @endereco = Factory::Dynamic.address
          form_endereco.input_apelido_endereco.gset @usuario[:apelido]
          form_endereco.input_nome.gset @usuario[:nome]
          form_endereco.input_sobrenome.gset @usuario[:apelido]
          form_endereco.input_cep.gset @endereco[:cep]
          form_endereco.input_numero_casa.gset @endereco[:numero]
          clica_btn_cadastrar
        end

        def adicionar_novo_endereco_exception (tipo)
          @usuario = Factory::Dynamic.user
          @endereco = Factory::Dynamic.address
          @tipo_erro = Factory::Static.static_file('cadastro_tipos_erro')
          case tipo
          when @tipo_erro[:campos_obrigatorios]
            form_endereco.input_apelido_endereco.gset @usuario[:apelido]
            form_endereco.input_nome.gset @usuario[:nome]
            form_endereco.input_sobrenome.gset @usuario[:apelido]
            form_endereco.input_cep.gset @endereco[:cep]
            form_endereco.input_numero_casa.gset ''

          when @tipo_erro[:nome_invalido]
            form_endereco.input_apelido_endereco.gset @usuario[:apelido]
            form_endereco.input_nome.gset @tipo_erro[:nome_invalido_massa]
            form_endereco.input_sobrenome.gset @usuario[:apelido]
            form_endereco.input_cep.gset @endereco[:cep]
            form_endereco.input_numero_casa.gset @endereco[:numero]
            clica_btn_cadastrar

          when @tipo_erro[:sobrenome_invalido]
            form_endereco.input_apelido_endereco.gset @usuario[:apelido]
            form_endereco.input_nome.gset @usuario[:nome]
            form_endereco.input_sobrenome.gset @tipo_erro[:nome_invalido_massa]
            form_endereco.input_cep.gset @endereco[:cep]
            form_endereco.input_numero_casa.gset @endereco[:numero]
            clica_btn_cadastrar
          else
            print "\n 404 - TIPO DE ERRO NÃO ENCONTRADO!"
          end
          clica_btn_cadastrar
        end

      end
    end
  end
end
