Quando('selecionar o primeiro produto da categoria camisetas') do
  @home_page = $web_pages.home
  @produto_page = $web_pages.produto
  @home_page.selecionar_categoria('CAMISETAS')
  @nome_produto = @home_page.retorna_nome_primeiro_produto
  @home_page.seleciona_primeiro_produto
end

Então('deverá exibir a página de informações') do
 expect(@produto_page.retorna_nome_produto).to eql @nome_produto
end
