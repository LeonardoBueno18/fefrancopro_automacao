Dado('que esteja na página de informações do produto') do
  @produto_page = $web_pages.produto
  @carrinho_page = $web_pages.carrinho
  @produto_page.load
end

Quando('adicionar o produto no carrinho') do
  @produto_page.seleciona_tamanho_p
  @produto_page.adicionar_no_carrinho
end

Então('deverá exibir um item adicionado no carrinho') do
  expect(@carrinho_page.retornar_quantidade_carrinho).to eql "1"
end
