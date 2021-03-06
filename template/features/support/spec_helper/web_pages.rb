Dir[File.join(File.dirname(__FILE__), 'page_objects/web/pages/*.rb')]
  .sort.each { |file| require file }

module Web
  module Pages
    class WebPages
      class << self
        def home
          Web::Pages::Home::Home.new
        end
        def login
          Web::Pages::Login::LoginPage.new
        end
        def meus_dados
          Web::Pages::MeusDados::MeusDadosPage.new
        end
        def cadastro
          Web::Pages::Cadastro::CadastroPage.new
        end
        def produto
          Web::Pages::Produto::ProdutoPage.new
        end
        def carrinho
          Web::Pages::Carrinho::CarrinhoPage.new
        end
        def endereco
          Web::Pages::Endereco::EnderecoPage.new
        end
        def envio
          Web::Pages::Envio::EnvioPage.new
        end
        def pagamento
          Web::Pages::Pagamento::PagamentoPage.new
        end
        def resumo
          Web::Pages::Resumo::ResumoPage.new
        end
      end
    end
  end
end
