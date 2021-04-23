require_relative '../sections/menu/nav_menu.rb'
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
        element :alert_sucesso, '.alert-success  > span'
        element :senha_atual, '#password_current'
        element :nova_senha, '#password'
        element :nova_senha_confirma, '#confirmation'
        element :btn_atualizar, '#btn-go'
        element :alert_nova_senha_confirma, ' li:nth-child(2) > div'
        element :alert_nova_senha, '.fields > li:nth-child(1) > div'
        element :input_nome, '#firstname'
        element :input_sobrenome, '#lastname'
        element :input_telefone, '#telephone'
        element :input_cpf, '#cpf'
        element :alerta_telefone, '.telephoneformError'
        element :alerta_nome, '.firstnameformError'
        element :alerta_sobrenome, '.lastnameformError'
        element :alerta_cpf, '.cpfformError'
        element :btn_novo_endereco, '.new-address'
        element :input_apelido_endereco, '#label'
        element :input_cep, '#postcode'
        element :input_numero, '#number'
        element :btn_cadastrar, '#btn-submit'
        element :nome_endereco, 'div.customer-address-list > ul > li:nth-child(1) > div.address > span.name'
        element :btn_remover_segundo_endereco, 'ul > li:nth-child(2) #btn-remove > i'
############################################
########### Metodos de retornos e alertas #
##########################################
        def retornar_texto_usuario
          texto_usuario.greenify
          texto_usuario.text
        end
        def remover_segundo_endereco
          btn_remover_segundo_endereco.gclick
        end
        def retornar_minha_conta
          span_minha_conta.greenify
          span_minha_conta.text
        end
        def retorna_alerta_telefone
          alerta_telefone.text
        end
        def retorna_alerta_nome
          alerta_nome.text
        end
        def retorna_alerta_sobrenome
          alerta_sobrenome.text
        end
        def retorna_alerta_cpf
          alerta_cpf.text
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
        def retorna_alerta_erro_senha (tipo)
          @tipo_erro = Factory::Static.static_file('cadastro_tipos_erro')
          case tipo
          when @tipo_erro[:senha_curta]
            alert_nova_senha.text
          when @tipo_erro[:senhas_diferentes]
            alert_nova_senha_confirma.text
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
############################################
########### Metodos de ações e cliques ####
##########################################
        def clica_btn_atualizar
          btn_atualizar.gclick
        end

        def clica_btn_cadastrar
          btn_cadastrar.gclick
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

        def troca_senha
          @usuario_fixo = Factory::Static.static_file('login')
          senha_atual.gset @usuario_fixo[:senha]
          nova_senha.gset @usuario_fixo[:senha]
          nova_senha_confirma.gset @usuario_fixo[:senha]
          clica_btn_atualizar
        end

        def troca_senha_exception (tipo)
          @usuario_fixo = Factory::Static.static_file('login')
          @tipo_erro = Factory::Static.static_file('cadastro_tipos_erro')
          case tipo
          when @tipo_erro[:senha_curta]
            senha_atual.gset @usuario_fixo[:senha]
            nova_senha.gset @tipo_erro[:senha_curta_massa]
            nova_senha_confirma.gset @tipo_erro[:senha_curta_massa]
          when @tipo_erro[:senhas_diferentes]
            senha_atual.gset @usuario_fixo[:senha]
            nova_senha.gset @usuario_fixo[:senha]
            nova_senha_confirma.gset @tipo_erro[:senha_diferente_massa2]
          else
            print "\n 404 - TIPO DE ERRO DE SENHA NÃO ENCONTRADO!!"
          end
          clica_btn_atualizar
        end

        def atualizar_dados_cadastrais
          @usuario_fixo = Factory::Static.static_file('login')
          input_nome.gset @usuario_fixo[:nome]
          input_sobrenome.gset @usuario_fixo[:sobrenome]
          clica_btn_atualizar
        end

        def atualizar_dados_cadastrais_exception (tipo)
          @tipo_erro = Factory::Static.static_file('cadastro_tipos_erro')
          case tipo
          when @tipo_erro[:campos_obrigatorios]
            input_telefone.gset ''
          when @tipo_erro[:nome_invalido]
            input_nome.gset @tipo_erro[:nome_invalido_massa]
          when @tipo_erro[:sobrenome_invalido]
            input_sobrenome.gset @tipo_erro[:nome_invalido_massa]
          when @tipo_erro[:cpf_invalido]
            input_cpf.gset @tipo_erro[:cpf_erro_massa]
          else
            print "\n 404 - TIPO DE ERRO NÃO ENCONTRADO!"
          end
        end

        def adicionar_novo_endereco
          @usuario = Factory::Dynamic.user
          @endereco = Factory::Dynamic.address
          input_apelido_endereco.gset @usuario[:apelido]
          input_nome.gset @usuario[:nome]
          input_sobrenome.gset @usuario[:apelido]
          input_cep.gset @endereco[:cep]
          input_numero.gset @endereco[:numero]
          clica_btn_cadastrar
        end

      end
    end
  end
end
