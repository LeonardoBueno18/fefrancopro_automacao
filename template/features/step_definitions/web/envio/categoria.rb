Dado('que esteja na tela de checkout') do
  @envio_page = $web_pages.envio
  @carrinho_page.finalizar_compra
end
Quando('selecionar a segunda categoria de envio') do
  @envio_page.clicar_btn_envio_expresso
end

Então('deverá exibir o prazo de entrega') do
  expect(@envio_page.retornar_text_prazo).to have_content @envio_page.retorna_texto_esperado
end
