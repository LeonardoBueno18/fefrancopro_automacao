Dado('que possua um item no carrinho de compras') do
  @produto_page = $web_pages.produto
  @carrinho_page = $web_pages.carrinho
  sleep 3
  @produto_page.load
  @produto_page.seleciona_tamanho_p
  @produto_page.adicionar_no_carrinho
end

Dado('que esteja na tela do carrinho de compras') do
  @carrinho_page.clica_btn_acessa_carrinho
end

Quando('remover o primeiro produto') do
  @carrinho_page.clicar_btn_remover_produto
end

Então('deverá exibir o retorno do carrinho {string}') do |retorno|
  expect(@carrinho_page.retorna_carrinho_vazio).to have_content retorno
end
