Dado('que esteja no login') do
  @login_page = $web_pages.login
  @login_page.load
end

Quando('realizar login') do
  @login_page.logar
end

Então('deverá exibir as informações da conta') do
  @meus_dados_page = $web_pages.meus_dados
  expect(@meus_dados_page.retornar_texto_usuario).to have_content @login_page.retorna_email_logado
end

Quando('realizar login com um usuario inválido {string}') do |tipo|
  @login_page.logar_exception(tipo)
end

Então('deverá exibir o {string}') do |erro|
  expect(@login_page.retorna_validacao(erro)).to eql erro
end
