Quando('selecionar o método boleto') do
  @pagamento_page = $web_pages.pagamento
  @pagamento_page.clicar_btn_boleto
end

Então('deverá gerar um boleto') do
  @pagamento_page.clicar_xxbtn_comprarxx
  expect(@pagamento_page.retornar_texto_span_btn_comprar).to eql @pagamento_page.retorna_texto_esperado_boleto
end
