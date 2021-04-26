require_relative '../sections/menu/nav_menu.rb'
require_relative '../sections/forms/cadastro_endereco_form.rb'
require_relative '../sections/forms/cadastro_usuario_form.rb'
require_relative '../sections/forms/senha_form.rb'

module Web
  module Pages
    module MeusDados
      class MeusDadosPage < SitePrism::Page
###################################################
########### Definição de elementos e sections ####
#################################################
        element :texto_usuario, '.profile-text'
        element :span_minha_conta, "span[itemprop='name']"
        section :nav_menu, Web::Sections::Menu::NavMenu, '.nav-menu'
        section :form_endereco, Web::Sections::Forms::CadastroEnderecoForm, '#ck-address'
        section :form_usuario, Web::Sections::Forms::CadastroUsuarioForm, '#ck-mydata'
        section :form_senha, Web::Sections::Forms::SenhaForm, '#ck-access'
        element :alert_sucesso, '.alert-success  > span'
        element :btn_atualizar, '#btn-go'
        element :btn_novo_endereco, '.new-address'
        element :btn_editar_primeiro_endereço, '.customer-address-list ul  li:nth-child(1)  div.actions  a'
        element :titulo_historico, '.section-title'
############################################
########### Metodos de retornos e alertas #
##########################################
        def retornar_texto_usuario
          texto_usuario.greenify
          texto_usuario.text
        end

        def retornar_minha_conta
          span_minha_conta.greenify
          span_minha_conta.text
        end
        def retorna_alerta_telefone
          form_usuario.alerta_telefone.text
        end
        def retorna_alerta_nome
          form_usuario.alerta_nome.text
        end
        def retorna_alerta_sobrenome
          form_usuario.alerta_sobrenome.text
        end
        def retorna_alerta_cpf
          form_usuario.alerta_cpf.text
        end

        def retorna_titulo_historico
          titulo_historico.greenify
          titulo_historico.text
        end
        def retorna_alerta_sucesso
          alert_sucesso.text
        end
        def retorna_alerta_erro_senha (tipo)
          @tipo_erro = Factory::Static.static_file('cadastro_tipos_erro')
          case tipo
          when @tipo_erro[:senha_curta]
            form_senha.alert_nova_senha.text
          when @tipo_erro[:senhas_diferentes]
            form_senha.alert_nova_senha_confirma.text
          else
            print "\n 404 - TIPO DE ERRO DE SENHA NÃO ENCONTRADO!!"
          end
        end

        def retorna_erros_cadastrais (tipo)
          @tipo_erro = Factory::Static.static_file('cadastro_tipos_erro')
          case tipo
          when @tipo_erro[:campos_obrigatorios]
            retorna_alerta_telefone
          when @tipo_erro[:nome_invalido]
            retorna_alerta_nome
          when @tipo_erro[:sobrenome_invalido]
            retorna_alerta_sobrenome
          when @tipo_erro[:cpf_invalido]
            retorna_alerta_cpf
          else
            print "\n 404 - TIPO DE ERRO NÃO ENCONTRADO!"
          end

        end

        def retorna_texto_esperado
          @texto_esperado = Factory::Static.static_file('texto_esperado')
          @texto_esperado[:sucesso]
        end
        def retorna_texto_esperado_historico
          @texto_esperado = Factory::Static.static_file('texto_esperado')
          @texto_esperado[:historico_pedidos]
        end

############################################
########### Metodos de ações e cliques ####
##########################################
        def clica_btn_atualizar
          btn_atualizar.gclick
        end

        def acessar_visualizar_pedidos
          nav_menu.a_visualizar_pedidos.gclick
        end

        def acessar_alteracao_acesso
          nav_menu.a_altera_acesso.gclick
        end

        def acessar_alterar_dados_cadastrais
          nav_menu.a_dados_cadastrais.gclick
        end
        def acessar_gerenciar_enderecos
          nav_menu.a_gerenciar_enderecos.gclick
        end

        def acessar_cadastro_novo_endereco
          btn_novo_endereco.gclick
        end

        def acessar_edicao_primeiro_endereco
          btn_editar_primeiro_endereço.gclick
        end

        def troca_senha
          @usuario_fixo = Factory::Static.static_file('login')
          form_senha.senha_atual.gset @usuario_fixo[:senha]
          form_senha.nova_senha.gset @usuario_fixo[:senha]
          form_senha.nova_senha_confirma.gset @usuario_fixo[:senha]
          clica_btn_atualizar
        end

        def troca_senha_exception (tipo)
          @usuario_fixo = Factory::Static.static_file('login')
          @tipo_erro = Factory::Static.static_file('cadastro_tipos_erro')
          case tipo
          when @tipo_erro[:senha_curta]
            form_senha.senha_atual.gset @usuario_fixo[:senha]
            form_senha.nova_senha.gset @tipo_erro[:senha_curta_massa]
            form_senha.nova_senha_confirma.gset @tipo_erro[:senha_curta_massa]
          when @tipo_erro[:senhas_diferentes]
            form_senha.senha_atual.gset @usuario_fixo[:senha]
            form_senha.nova_senha.gset @usuario_fixo[:senha]
            form_senha.nova_senha_confirma.gset @tipo_erro[:senha_diferente_massa2]
          else
            print "\n 404 - TIPO DE ERRO DE SENHA NÃO ENCONTRADO!!"
          end
          clica_btn_atualizar
        end

        def atualizar_dados_cadastrais
          @usuario_fixo = Factory::Static.static_file('login')
          form_usuario.input_nome.gset @usuario_fixo[:nome]
          form_usuario.input_sobrenome.gset @usuario_fixo[:sobrenome]
          clica_btn_atualizar
        end

        def atualizar_dados_cadastrais_exception (tipo)
          @tipo_erro = Factory::Static.static_file('cadastro_tipos_erro')
          case tipo
          when @tipo_erro[:campos_obrigatorios]
            form_usuario.input_telefone.gset ''
          when @tipo_erro[:nome_invalido]
            form_usuario.input_nome.gset @tipo_erro[:nome_invalido_massa]
          when @tipo_erro[:sobrenome_invalido]
            form_usuario.input_sobrenome.gset @tipo_erro[:nome_invalido_massa]
          when @tipo_erro[:cpf_invalido]
            form_usuario.input_cpf.gset @tipo_erro[:cpf_erro_massa]
          else
            print "\n 404 - TIPO DE ERRO NÃO ENCONTRADO!"
          end
        end


      end
    end
  end
end
