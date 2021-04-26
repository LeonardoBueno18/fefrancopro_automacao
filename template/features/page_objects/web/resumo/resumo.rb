module Web
  module Pages
    module Resumo
      class ResumoPage < SitePrism::Page
###################################################
########### Definição de elementos e sections ####
#################################################
        element :btn_cupom, 'li.coupon-apply > label'
        element :input_cupom, '#coupon_code'
        element :btn_aplica_cupom, '.fields > li > button'
        element :alert_cupom, 'li.coupon-apply > div'
############################################
########### Metodos de retornos e alertas #
##########################################
        def retorna_alerta_cupom
          alert_cupom.greenify
          alert_cupom.text
        end
############################################
########### Metodos de ações e cliques ####
##########################################
        def clica_btn_cupom
          btn_cupom.gclick
        end
        def preenche_cupom
          @cupom = Factory::Static.static_file('cupom')
          input_cupom.gset @cupom[:cupom_ok]
          btn_aplica_cupom.gclick
        end
        def preenche_cupom_exception (tipo)
          @cupom = Factory::Static.static_file('cupom')
          @tipo_erro = Factory::Static.static_file('cadastro_tipos_erro')
          case tipo
          when @tipo_erro[:cupom_expirado]
            input_cupom.gset @cupom[:cupom_expirado]

          when @tipo_erro[:cupom_nao_existe]

            input_cupom.gset @cupom[:cupom_fail]
          else

          end
          btn_aplica_cupom.gclick
        end

      end
    end
  end
end
