module Web
  module Pages
    module Pagamento
      class PagamentoPage < SitePrism::Page
###################################################
########### Definição de elementos e sections ####
#################################################
        element :btn_boleto, '#boleto'
        element :btn_cartao_credito, '#payment-type-credito'
        #formulario cc
        element :input_numero_cc, '#ccnumber'
        element :input_nome_cc, '#ccname'
        element :input_codigo_cc, '#cccvc'
        element :select_mes_cc, '#ccmonth'
        element :select_ano_cc, '#ccyear'
        #meses cc
        element :option_mes_12_cc, '#ccmonth > option:nth-child(13)'
        #anos cc
        element :option_ano_2028_cc, '#ccyear > option:nth-child(10)'
        #btn comprar e texto
        element :span_btn_comprar, 'span > button > span'
        element :xxbtn_comprarxx, 'span > button'
        element :titulo_resumo, ' div.summary > div.topic'
        #açertas formulario cc
        element :alert_numero_cc, '.ccnumberformError'
        element :alert_bandeira_cc, '.pagme_visaformError'
        element :alert_nome_cc, '.ccnameformError'
        element :alert_codigo_cc, '.cccvcformError'

############################################
########### Metodos de retornos e alertas #
##########################################
        def retornar_texto_span_btn_comprar
          span_btn_comprar.greenify
          span_btn_comprar.text
        end
        def retorna_alerta_nome_cc
          alert_nome_cc.greenify
          alert_nome_cc.text
        end
        def retorna_alerta_bandeira_cc
          alert_bandeira_cc.greenify
          alert_bandeira_cc.text
        end
        def retorna_alerta_codigo_cc
          alert_codigo_cc.greenify
          alert_codigo_cc.text
        end
        def retorna_texto_esperado_boleto
          @texto_esperado = Factory::Static.static_file('texto_esperado')
          @texto_esperado[:finalizar_compra]
        end
        def retorna_texto_esperado_cc
          @texto_esperado = Factory::Static.static_file('texto_esperado')
          @texto_esperado[:finalizar_compra_cc]
        end
        def retorna_titulo_resumo
          titulo_resumo.greenify
          titulo_resumo.text
        end
        def retorna_alertas_cc (tipo)
          @tipo_erro = Factory::Static.static_file('cadastro_tipos_erro')
          case tipo
          when @tipo_erro[:campos_obrigatorios]
            retorna_alerta_nome_cc
          when @tipo_erro[:numero_cc_invalido]
            retorna_alerta_bandeira_cc
          when @tipo_erro[:codigo_cc_curto]
            retorna_alerta_codigo_cc
          else
            print "\n404 - ERRO CC NÃO IDENTIFICADO!!\n"
          end

        end
############################################
########### Metodos de ações e cliques ####
##########################################
        def clicar_btn_boleto
          btn_boleto.gclick
        end
        def clicar_btn_cartao_credito
          btn_cartao_credito.gclick
        end
        def clicar_xxbtn_comprarxx
          print "\n PARABÉNS, VOCÊ GEROU O BOLETO OU COMPOU ESTE PRODUTO!"
          #xxbtn_comprarxx.gclick
        end
        def clicar_xxbtn_comprar_exceptionxx
         #print "\n PARABÉNS, VOCÊ GEROU O BOLETO OU COMPOU ESTE PRODUTO!"
          xxbtn_comprarxx.gclick
        end
        def preencher_formulario_cc
          @cc = Factory::Dynamic.card
          input_numero_cc.gset @cc[:numero]
          input_nome_cc.gset @cc[:titular]
          input_codigo_cc.gset @cc[:cvv]
          if @cc[:validade_mes] == '12'
            select_mes_cc.gclick
            sleep 2
            option_mes_12_cc.gclick
          else
            print "\n Mês não encontrados!!\n"
          end
          if @cc[:validade_ano] == '2028'
            select_ano_cc.gclick
            sleep 2
            option_ano_2028_cc.gclick

          else
            print "\n Ano não encontrados!!\n"
          end
          clicar_xxbtn_comprarxx
        end

        def preencher_formulario_cc_exception (tipo)
          @tipo_erro = Factory::Static.static_file('cadastro_tipos_erro')
          @cc = Factory::Dynamic.card
          case tipo
          when @tipo_erro[:campos_obrigatorios]

            input_numero_cc.gset @cc[:numero]
            input_nome_cc.gset ''
            input_codigo_cc.gset @cc[:cvv]

            if @cc[:validade_mes] == '12'
              select_mes_cc.gclick
              sleep 0.5
              option_mes_12_cc.gclick
            else
              print "\n Mês não encontrados!!\n"
            end

            if @cc[:validade_ano] == '2028'
              select_ano_cc.gclick
              sleep 0.5
              option_ano_2028_cc.gclick
            else
              print "\n Ano não encontrados!!\n"
            end

          when @tipo_erro[:numero_cc_invalido]

            input_numero_cc.gset @cc[:numero]
            input_nome_cc.gset @cc[:titular]
            input_codigo_cc.gset @cc[:cvv]

            if @cc[:validade_mes] == '12'
              select_mes_cc.gclick
              sleep 0.5
              option_mes_12_cc.gclick
            else
              print "\n Mês não encontrados!!\n"
            end
            if @cc[:validade_ano] == '2028'
              select_ano_cc.gclick
              sleep 0.5
              option_ano_2028_cc.gclick

            else
              print "\n Ano não encontrados!!\n"
            end
            input_numero_cc.gset @tipo_erro[:numero_cc_invalido_massa]
            clicar_xxbtn_comprar_exceptionxx
            sleep 0.5
            clicar_xxbtn_comprar_exceptionxx
          when @tipo_erro[:codigo_cc_curto]

            input_numero_cc.gset @cc[:numero]
            input_nome_cc.gset @cc[:titular]
            input_codigo_cc.gset @tipo_erro[:codigo_cc_curto_massa]
            if @cc[:validade_mes] == '12'
              select_mes_cc.gclick
              sleep 0.5
              option_mes_12_cc.gclick
            else
              print "\n Mês não encontrados!!\n"
            end
            if @cc[:validade_ano] == '2028'
              select_ano_cc.gclick
              sleep 0.5
              option_ano_2028_cc.gclick

            else
              print "\n Ano não encontrados!!\n"
            end
          else
            print "\n404 - ERRO CC NÃO IDENTIFICADO!!\n"
          end
        end
      end
    end
  end
end
