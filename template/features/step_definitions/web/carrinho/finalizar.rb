Quando('finalizar a compra') do
  @carrinho_page.finalizar_compra
end

Então('deverá exibir a tela de seleção de destino') do
  expect(@carrinho_page.retorna_titulo_endereco).to have_content @carrinho_page.retorna_texto_esperado
end
