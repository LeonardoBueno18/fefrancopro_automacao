Dado('na tela de edição de dados cadastrais') do
  @meus_dados_page = $web_pages.meus_dados
  @meus_dados_page.acessar_alterar_dados_cadastrais
end

Quando('editar os dados cadastrais') do
  @meus_dados_page.atualizar_dados_cadastrais
end

Quando('editar os dados cadastrais com dados inválidos {string}') do |tipo|
  @tipo = tipo
  @meus_dados_page.atualizar_dados_cadastrais_exception(@tipo)
end

Então('deverá exibir os dados cadastrais atualizados') do
  expect(@meus_dados_page.retorna_alerta_sucesso).to eql @meus_dados_page.retorna_texto_esperado
end



Então('deverá exibir o alerta na alteração cadastral {string}') do |retorno|
  expect(@meus_dados_page.retorna_erros_cadastrais(@tipo)).to have_content retorno
end
