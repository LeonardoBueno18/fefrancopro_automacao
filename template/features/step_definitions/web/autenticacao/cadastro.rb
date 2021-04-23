Dado('que esteja no cadastro') do
  @cadastro_page = $web_pages.cadastro
  @meus_dados_page = $web_pages.meus_dados
  @retorno_html = Factory::Static.static_file('textos_esperados_html')
  @cadastro_page.load
end
Dado('que esteja na aba de pessoa jurídica') do
  @cadastro_page.acessar_pj
end

Quando('finalizar o cadastro') do
  @cadastro_page.cadastro_pf
end
Então('deverá exibir a minha conta') do
  expect(@meus_dados_page.retornar_minha_conta).to have_content @retorno_html[:minha_conta]
end

Quando('preencher o cadastro com dados inválidos {string}') do |tipo|
  @tipo = tipo
  @cadastro_page.cadastro_pf_exception(@tipo)
end

Quando('finalizar o cadastro PJ') do
  @cadastro_page.cadastro_pj
end

Quando('preencher o cadastro PJ com dados inválidos {string}') do |tipo|
  @tipo = tipo
  @cadastro_page.cadastro_pj_exception(@tipo)
end

Então('deverá exibir o alerta {string}') do |erro|
  expect(@cadastro_page.retorna_alertas_cadastro(@tipo)).to have_content erro
end


Então('deverá exibir as informações da nova conta') do
  expect(@meus_dados_page.retornar_minha_conta).to have_content @retorno_html[:minha_conta]
end

Então('deverá exibir o alerta PJ {string}') do |erro|
  expect(@cadastro_page.retorna_alertas_cadastro(@tipo)).to have_content erro

end
