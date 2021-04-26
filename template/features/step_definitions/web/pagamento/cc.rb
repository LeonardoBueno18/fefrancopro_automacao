Quando('selecionar o método cartão de crédito') do
  @pagamento_page = $web_pages.pagamento
  sleep 3
  @pagamento_page.clicar_btn_cartao_credito
end

Quando('preencher os dados válidos do cartão') do
  @pagamento_page.preencher_formulario_cc
end

Quando('preencher os dados inválidos do cartão {string}') do |tipo|
  @tipo = tipo
  @pagamento_page.preencher_formulario_cc_exception(@tipo)
end

Então('deverá exibir o resumo da compra') do
  expect(@pagamento_page.retorna_titulo_resumo).to eql @pagamento_page.retorna_texto_esperado_cc
end

Então('deverá exibir o retorno {string} na finalização da compra') do |retorno|
  expect(@pagamento_page.retorna_alertas_cc(@tipo)).to eql retorno
end
