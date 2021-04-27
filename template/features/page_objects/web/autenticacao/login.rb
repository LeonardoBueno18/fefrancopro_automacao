module Web
  module Pages
    module Login
      class LoginPage < SitePrism::Page
        set_url '/login'
###################################################
########### Definição de elementos e sections ####
#################################################
        element :input_email, '#input-email'
        element :btn_avancar, '#btn-go'
        element :input_senha, '#input-password'
        element :alerta_senha, '.alert.alert-warning > span'


############################################
########### Metodos de ações e cliques ####
##########################################
        def clicar_btn_avancar
          btn_avancar.gclick
        end
        def logar
          @usuario = Factory::Static.static_file('login')
          input_email.gset @usuario[:email]
          clicar_btn_avancar
          input_senha.gset @usuario[:senha]
          clicar_btn_avancar
        end
        def logar_exception(tipo)
          @usuario = Factory::Static.static_file('login')
          @tipo_erro = Factory::Static.static_file('login_exception')

          case tipo
          when @tipo_erro[:senha_incorreta]
            input_email.gset @usuario[:email]
            clicar_btn_avancar
            input_senha.gset @usuario[:senha_errada]
            clicar_btn_avancar
          when @tipo_erro[:email_incorreto]
            input_email.gset @usuario[:email_nao_cadastrado]
            clicar_btn_avancar
          else
            print "\n 404-TIPO DE ERRO NÃO ENCONTRADO!!!"
          end
        end

############################################
########### Metodos de retornos e alertas #
##########################################
        def retorna_email_logado
          @usuario[:email]
        end
        def retorna_alerta_senha
          alerta_senha.greenify
          alerta_senha.text
        end
        def retorna_validacao(erro)
          @tipo_erro = Factory::Static.static_file('login_exception')
          @erro = erro
          case @erro
          when @tipo_erro[:senha_erro]
            retorna_alerta_senha
          when @tipo_erro[:email_errado]
            @cadastro_page =$web_pages.cadastro
            @cadastro_page.retorna_titulo
          else
            print "\n 404-TIPO DE ERRO NÃO ENCONTRADO!!!"
          end
        end
      end
    end
  end
end
