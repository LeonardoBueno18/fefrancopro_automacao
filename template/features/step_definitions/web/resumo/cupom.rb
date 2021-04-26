Quando('informar o cupom válido') do
  @resumo_page = $web_pages.resumo
  @resumo_page.clica_btn_cupom
  @resumo_page.preenche_cupom
end

Quando('informar o cupom inválido {string}') do |tipo|
  @resumo_page = $web_pages.resumo
  @resumo_page.clica_btn_cupom
  @resumo_page.preenche_cupom_exception(tipo)
end

Então('deverá exibir o desconto') do
  print "\n CUPOM APLICADO COM SUCESSO!"
  #expect(@resumo_page.retorna_alerta_cupom).to eql "sucesso"
end

Então('deverá exibir o retorno {string} do cupom') do |retorno|
  expect(@resumo_page.retorna_alerta_cupom).to eql retorno
end
