module Web
  module Pages
    module Envio
      class EnvioPage < SitePrism::Page
###################################################
########### Definição de elementos e sections ####
#################################################
        element :btn_envio_expresso, '#shipping-mandae_fretemandae'
        element :text_prazo, '.message'

############################################
########### Metodos de retornos e alertas #
##########################################
        def retornar_text_prazo
          text_prazo.greenify
          text_prazo.text
        end

        def retorna_texto_esperado
          @texto_esperado = Factory::Static.static_file('texto_esperado')
          @texto_esperado[:prazo_entrega]
        end
############################################
########### Metodos de ações e cliques ####
##########################################
        def clicar_btn_envio_expresso
          btn_envio_expresso.gclick
        end
      end
    end
  end
end
