Quando('selecionar o tamanho do produto {string}') do |tamanho|
  @produto_page = $web_pages.produto
  @tamanho = tamanho
  @produto_page.selecionador_de_tamanhos(@tamanho)
end

Então('deverá informar a disponibilidade') do
  expect(@produto_page.retorna_dispinibilidade(@tamanho)).to have_content @produto_page.retorna_mensagens_esperadas(@tamanho)
end
