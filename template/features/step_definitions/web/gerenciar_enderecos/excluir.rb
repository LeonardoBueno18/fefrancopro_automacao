Quando('excluir o segundo endereço') do
  @meus_dados_page = $web_pages.meus_dados
  @meus_dados_page.remover_segundo_endereco


end
Então('deverá exibir a mensagem de sucesso {string}') do |sucesso|
  expect(@meus_dados_page.retorna_alerta_sucesso).to eql sucesso
end
