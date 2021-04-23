module Web
  module Sections
    module Headers
      class CategoriaHeader < SitePrism::Section
          element :a_acessorios, 'li:nth-child(1) > a'
          element :a_bermuda, 'li:nth-child(2) > a'
          element :a_bone, 'li:nth-child(3) > a'
          element :a_calca, 'li:nth-child(4) > a'
          element :a_camisetas, 'li:nth-child(5) > a'
          element :a_feminina, 'li:nth-child(6) > a'
          element :a_marmiteira, 'li:nth-child(7) > a'
          element :a_mochila, 'li:nth-child(8) > a'
          element :a_moletom, 'li:nth-child(9) > a'
          element :a_monster, 'li:nth-child(10) > a'
          element :a_regatas, 'li:nth-child(11) > a'
      end
    end
  end
end
