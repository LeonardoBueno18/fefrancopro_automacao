Quando('realizar uma busca por {string}') do |produto|
  @home_page = $web_pages.home
  @produto = produto
  @home_page.buscar_produtos(@produto)
end

Então('deverá exibir a lista de produtos correspondentes') do
  expect(@home_page.retorna_nome_pesquisa).to have_content @produto.upcase
end
