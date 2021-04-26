Quando('selecionar a aba Visualizar pedidos') do
  @meus_dados_page = $web_pages.meus_dados
  @meus_dados_page.acessar_visualizar_pedidos
end

Então('deverá exibir o histórico de pedidos') do
  expect(@meus_dados_page.retorna_titulo_historico).to eql @meus_dados_page.retorna_texto_esperado_historico
end
