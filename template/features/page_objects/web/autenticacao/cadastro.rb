require_relative '../sections/forms/cadastro_form.rb'
module Web
  module Pages
    module Cadastro
      class CadastroPage < SitePrism::Page
        set_url '/cadastro'
###################################################
########### Definição de elementos e sections ####
#################################################
        section :cadastro_form, Web::Sections::Forms::CadastroForm, '#ck-register'
############################################
########### Metodos de retornos e alertas #
##########################################
        def retorna_titulo
          cadastro_form.titulo_pagina.greenify
          cadastro_form.titulo_pagina.text
        end
        def retorna_email_novo
          @usuario[:email]
        end
        def retorna_alertas_cadastro (tipo)
          @tipo_erro = Factory::Static.static_file('cadastro_tipos_erro')
          case tipo
          when @tipo_erro[:campos_obrigatorios]
            cadastro_form.alerta_telefone.text
          when @tipo_erro[:nome_invalido]
            cadastro_form.alerta_nome.text

          when @tipo_erro[:sobrenome_invalido]
            cadastro_form.alerta_sobrenome.text

          when @tipo_erro[:cpf_invalido]
            cadastro_form.alertas.text

          when @tipo_erro[:email_invalido]
            cadastro_form.alertas.text

          when @tipo_erro[:senha_curta]
            cadastro_form.alertas.text

          when @tipo_erro[:senhas_diferentes]
            cadastro_form.alertas.text

          when @tipo_erro[:cnpj_invalido]
            cadastro_form.alertas.text

          when @tipo_erro[:razao_social_curta]
            cadastro_form.alertas.text
          else
            print "\n 404 - ERRO NÃO ENCONTRADO!!"
          end

        end
############################################
########### Metodos de ações e cliques ####
##########################################
        def clicar_btn_cadastrar
          cadastro_form.btn_cadastrar.gclick
        end
        def acessar_pj
          cadastro_form.btn_pj.gclick
        end
        def cadastro_pf
          @usuario = Factory::Dynamic.user
          cadastro_form.input_primeiro_nome.gset @usuario[:nome]
          cadastro_form.input_sobrenome.gset @usuario[:apelido]
          if @usuario[:sexo] == 'Female'
            cadastro_form.btn_femea.gclick
          elsif @usuario[:sexo] == 'Male'
            cadastro_form.btn_macho.gclick
          end
          cadastro_form.input_nascimento.gset @usuario[:nascimento]
          cadastro_form.input_cpf.gset @usuario[:cpf]
          cadastro_form.input_telefone.gset @usuario[:telefone]
          cadastro_form.input_celular.gset @usuario[:celular]
          @endereco = Factory::Dynamic.address
          cadastro_form.input_cep.gset @endereco[:cep]
          cadastro_form.input_numero_casa.gset @endereco[:numero]
          cadastro_form.input_email.gset @usuario[:email]
          cadastro_form.input_senha.gset @usuario[:senha]
          cadastro_form.input_senha_confirma.gset @usuario[:senha]
          clicar_btn_cadastrar
        end

        def cadastro_pj
          @usuario = Factory::Dynamic.user
          cadastro_form.input_primeiro_nome.gset @usuario[:nome]
          cadastro_form.input_sobrenome.gset @usuario[:apelido]
          cadastro_form.input_razao_social.gset @usuario[:nome]
          cadastro_form.input_nome_fantasia.gset @usuario[:nome]
          cadastro_form.input_cnpj.set_value_with_mask(@usuario[:cnpj])
          cadastro_form.input_telefone.gset @usuario[:telefone]
          cadastro_form.input_celular.gset @usuario[:celular]
          @endereco = Factory::Dynamic.address
          cadastro_form.input_cep.gset @endereco[:cep]
          cadastro_form.input_numero_casa.gset @endereco[:numero]
          cadastro_form.input_email.gset @usuario[:email]
          cadastro_form.input_senha.gset @usuario[:senha]
          cadastro_form.input_senha_confirma.gset @usuario[:senha]
          clicar_btn_cadastrar
        end
        ######################################################
        ############# Pessoa Fisica #########################
        ####################################################
        def cadastro_pf_exception(tipo)
          @tipo_erro = Factory::Static.static_file('cadastro_tipos_erro')
          case tipo
          when @tipo_erro[:campos_obrigatorios]
            clicar_btn_cadastrar
          when @tipo_erro[:nome_invalido]
            cadastro_form.input_primeiro_nome.gset @tipo_erro[:nome_invalido_massa]
            clicar_btn_cadastrar

          when @tipo_erro[:sobrenome_invalido]
            cadastro_form.input_sobrenome.gset @tipo_erro[:nome_invalido_massa]
            clicar_btn_cadastrar

          when @tipo_erro[:cpf_invalido]
            @usuario = Factory::Dynamic.user
            cadastro_form.input_primeiro_nome.gset @usuario[:nome]
            cadastro_form.input_sobrenome.gset @usuario[:apelido]
            if @usuario[:sexo] == 'Female'
              cadastro_form.btn_femea.gclick
            elsif @usuario[:sexo] == 'Male'
              cadastro_form.btn_macho.gclick
            end
            cadastro_form.input_nascimento.gset @usuario[:nascimento]
            cadastro_form.input_cpf.gset @tipo_erro[:cpf_erro_massa]
            cadastro_form.input_telefone.gset @usuario[:telefone]
            cadastro_form.input_celular.gset @usuario[:celular]
            @endereco = Factory::Dynamic.address
            cadastro_form.input_cep.gset @endereco[:cep]
            cadastro_form.input_numero_casa.gset @endereco[:numero]
            cadastro_form.input_email.gset @usuario[:email]
            cadastro_form.input_senha.gset @usuario[:senha]
            cadastro_form.input_senha_confirma.gset @usuario[:senha]
            clicar_btn_cadastrar

          when @tipo_erro[:email_invalido]
            @usuario = Factory::Dynamic.user
            cadastro_form.input_primeiro_nome.gset @usuario[:nome]
            cadastro_form.input_sobrenome.gset @usuario[:apelido]
            if @usuario[:sexo] == 'Female'
              cadastro_form.btn_femea.gclick
            elsif @usuario[:sexo] == 'Male'
              cadastro_form.btn_macho.gclick
            end
            cadastro_form.input_nascimento.gset @usuario[:nascimento]
            cadastro_form.input_cpf.gset @usuario[:cpf]
            cadastro_form.input_telefone.gset @usuario[:telefone]
            cadastro_form.input_celular.gset @usuario[:celular]
            @endereco = Factory::Dynamic.address
            cadastro_form.input_cep.gset @endereco[:cep]
            cadastro_form.input_numero_casa.gset @endereco[:numero]
            cadastro_form.input_email.gset @tipo_erro[:email_invalido_massa]
            cadastro_form.input_senha.gset @usuario[:senha]
            cadastro_form.input_senha_confirma.gset @usuario[:senha]
            clicar_btn_cadastrar

          when @tipo_erro[:senha_curta]
            @usuario = Factory::Dynamic.user
            cadastro_form.input_primeiro_nome.gset @usuario[:nome]
            cadastro_form.input_sobrenome.gset @usuario[:apelido]
            if @usuario[:sexo] == 'Female'
              cadastro_form.btn_femea.gclick
            elsif @usuario[:sexo] == 'Male'
              cadastro_form.btn_macho.gclick
            end
            cadastro_form.input_nascimento.gset @usuario[:nascimento]
            cadastro_form.input_cpf.gset @usuario[:cpf]
            cadastro_form.input_telefone.gset @usuario[:telefone]
            cadastro_form.input_celular.gset @usuario[:celular]
            @endereco = Factory::Dynamic.address
            cadastro_form.input_cep.gset @endereco[:cep]
            cadastro_form.input_numero_casa.gset @endereco[:numero]
            cadastro_form.input_email.gset @usuario[:email]
            cadastro_form.input_senha.gset @tipo_erro[:senha_curta_massa]
            cadastro_form.input_senha_confirma.gset @tipo_erro[:senha_curta_massa]
            clicar_btn_cadastrar

          when @tipo_erro[:senhas_diferentes]
            @usuario = Factory::Dynamic.user
            cadastro_form.input_primeiro_nome.gset @usuario[:nome]
            cadastro_form.input_sobrenome.gset @usuario[:apelido]
            if @usuario[:sexo] == 'Female'
              cadastro_form.btn_femea.gclick
            elsif @usuario[:sexo] == 'Male'
              cadastro_form.btn_macho.gclick
            end
            cadastro_form.input_nascimento.gset @usuario[:nascimento]
            cadastro_form.input_cpf.gset @usuario[:cpf]
            cadastro_form.input_telefone.gset @usuario[:telefone]
            cadastro_form.input_celular.gset @usuario[:celular]
            @endereco = Factory::Dynamic.address
            cadastro_form.input_cep.gset @endereco[:cep]
            cadastro_form.input_numero_casa.gset @endereco[:numero]
            cadastro_form.input_email.gset @usuario[:email]
            cadastro_form.input_senha.gset @tipo_erro[:senha_diferente_massa1]
            cadastro_form.input_senha_confirma.gset @tipo_erro[:senha_diferente_massa2]
            clicar_btn_cadastrar
          else
            print "\n 404 - ERRO NÃO ENCONTRADO!!"
          end
        end
        ######################################################
        ############# Pessoa Juridica #######################
        ####################################################
        def cadastro_pj_exception(tipo)
          @tipo_erro = Factory::Static.static_file('cadastro_tipos_erro')
          case tipo
          when @tipo_erro[:campos_obrigatorios]
            clicar_btn_cadastrar
          when @tipo_erro[:nome_invalido]
            cadastro_form.input_primeiro_nome.gset @tipo_erro[:nome_invalido_massa]
            clicar_btn_cadastrar

          when @tipo_erro[:sobrenome_invalido]
            cadastro_form.input_sobrenome.gset @tipo_erro[:nome_invalido_massa]
            clicar_btn_cadastrar

          when @tipo_erro[:cnpj_invalido]
            @usuario = Factory::Dynamic.user
            cadastro_form.input_primeiro_nome.gset @usuario[:nome]
            cadastro_form.input_sobrenome.gset @usuario[:apelido]
            cadastro_form.input_razao_social.gset @usuario[:nome]
            cadastro_form.input_nome_fantasia.gset @usuario[:nome]
            cadastro_form.input_cnpj.set_value_with_mask(@tipo_erro[:cnpj_invalido_massa])
            cadastro_form.input_telefone.gset @usuario[:telefone]
            cadastro_form.input_celular.gset @usuario[:celular]
            @endereco = Factory::Dynamic.address
            cadastro_form.input_cep.gset @endereco[:cep]
            cadastro_form.input_numero_casa.gset @endereco[:numero]
            cadastro_form.input_email.gset @usuario[:email]
            cadastro_form.input_senha.gset @usuario[:senha]
            cadastro_form.input_senha_confirma.gset @usuario[:senha]
            clicar_btn_cadastrar

          when @tipo_erro[:email_invalido]
            @usuario = Factory::Dynamic.user
            cadastro_form.input_primeiro_nome.gset @usuario[:nome]
            cadastro_form.input_sobrenome.gset @usuario[:apelido]
            cadastro_form.input_razao_social.gset @usuario[:nome]
            cadastro_form.input_nome_fantasia.gset @usuario[:nome]
            cadastro_form.input_cnpj.set_value_with_mask(@usuario[:cnpj])
            cadastro_form.input_telefone.gset @usuario[:telefone]
            cadastro_form.input_celular.gset @usuario[:celular]
            @endereco = Factory::Dynamic.address
            cadastro_form.input_cep.gset @endereco[:cep]
            cadastro_form.input_numero_casa.gset @endereco[:numero]
            cadastro_form.input_email.gset @tipo_erro[:email_invalido_massa]
            cadastro_form.input_senha.gset @usuario[:senha]
            cadastro_form.input_senha_confirma.gset @usuario[:senha]
            clicar_btn_cadastrar

          when @tipo_erro[:razao_social_curta]
            @usuario = Factory::Dynamic.user
            cadastro_form.input_primeiro_nome.gset @usuario[:nome]
            cadastro_form.input_sobrenome.gset @usuario[:apelido]
            cadastro_form.input_razao_social.gset @tipo_erro[:nome_invalido_massa]
            cadastro_form.input_cnpj.set_value_with_mask(@usuario[:cnpj])
            cadastro_form.input_telefone.gset @usuario[:telefone]
            cadastro_form.input_celular.gset @usuario[:celular]
            @endereco = Factory::Dynamic.address
            cadastro_form.input_cep.gset @endereco[:cep]
            cadastro_form.input_numero_casa.gset @endereco[:numero]
            cadastro_form.input_email.gset @usuario[:email]
            cadastro_form.input_senha.gset @usuario[:senha]
            cadastro_form.input_senha_confirma.gset @usuario[:senha]
            clicar_btn_cadastrar

          when @tipo_erro[:senha_curta]
            @usuario = Factory::Dynamic.user
            cadastro_form.input_primeiro_nome.gset @usuario[:nome]
            cadastro_form.input_sobrenome.gset @usuario[:apelido]
            cadastro_form.input_razao_social.gset @usuario[:nome]
            cadastro_form.input_nome_fantasia.gset @usuario[:nome]
            cadastro_form.input_cnpj.set_value_with_mask(@usuario[:cnpj])
            cadastro_form.input_telefone.gset @usuario[:telefone]
            cadastro_form.input_celular.gset @usuario[:celular]
            @endereco = Factory::Dynamic.address
            cadastro_form.input_cep.gset @endereco[:cep]
            cadastro_form.input_numero_casa.gset @endereco[:numero]
            cadastro_form.input_email.gset @usuario[:email]
            cadastro_form.input_senha.gset @tipo_erro[:senha_curta_massa]
            cadastro_form.input_senha_confirma.gset @tipo_erro[:senha_curta_massa]
            clicar_btn_cadastrar

          when @tipo_erro[:senhas_diferentes]
            @usuario = Factory::Dynamic.user
            cadastro_form.input_primeiro_nome.gset @usuario[:nome]
            cadastro_form.input_sobrenome.gset @usuario[:apelido]
            cadastro_form.input_razao_social.gset @usuario[:nome]
            cadastro_form.input_nome_fantasia.gset @usuario[:nome]
            cadastro_form.input_cnpj.set_value_with_mask(@usuario[:cnpj])
            cadastro_form.input_telefone.gset @usuario[:telefone]
            cadastro_form.input_celular.gset @usuario[:celular]
            @endereco = Factory::Dynamic.address
            cadastro_form.input_cep.gset @endereco[:cep]
            cadastro_form.input_numero_casa.gset @endereco[:numero]
            cadastro_form.input_email.gset @usuario[:email]
            cadastro_form.input_senha.gset @tipo_erro[:senha_diferente_massa1]
            cadastro_form.input_senha_confirma.gset @tipo_erro[:senha_diferente_massa2]
            clicar_btn_cadastrar
          else
            print "\n 404 - ERRO NÃO ENCONTRADO!!"
          end
        end
      end
    end
  end
end
