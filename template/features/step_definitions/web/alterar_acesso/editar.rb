Dado('que esteja logado') do
  @login_page = $web_pages.login
  @resumo_page = $web_pages.resumo
  @meus_dados_page = $web_pages.meus_dados
  @login_page.load
  @login_page.logar
end

Dado('que esteja na tela de alteração de acesso') do
 @meus_dados_page.acessar_alteracao_acesso
end

Quando('editar os dados de acesso') do
  @meus_dados_page.troca_senha
end

Quando('preencher os dados de atualização de acesso inválidos {string}') do |tipo|
  @tipo = tipo
  @meus_dados_page.troca_senha_exception(@tipo)
end

Então('deverá exibir o retorno da atualização de acesso {string}') do |retorno|
  expect(@meus_dados_page.retorna_alerta_sucesso).to eql retorno
end



Então('deverá exibir o alerta de erro na atualização de acesso {string}') do |retorno|
  expect(@meus_dados_page.retorna_alerta_erro_senha(@tipo)).to eql retorno
end
