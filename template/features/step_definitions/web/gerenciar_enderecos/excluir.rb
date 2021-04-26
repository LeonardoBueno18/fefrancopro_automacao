Quando('excluir o segundo endereço') do
  @endereco_page = $web_pages.endereco
  @endereco_page.remover_segundo_endereco


end
Então('deverá exibir a mensagem de sucesso {string}') do |sucesso|
  expect(@endereco_page.retorna_alerta_sucesso).to eql sucesso
end
