Quando('selecionar a categoria {string}') do |categoria|
  @home_page = $web_pages.home
  @categoria = categoria
  @home_page.selecionar_categoria(categoria)
end

Então('deverá exibir a lista de produtos correspondentes a categoria') do
  expect(@home_page.retorna_nome_pesquisa).to eql @categoria
end
