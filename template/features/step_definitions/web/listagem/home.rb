Então('deverá exibir a lista de produtos em destaque') do
  @home_page = $web_pages.home
  @resultado = Factory::Static.static_file('textos_esperados_html')
  expect(@home_page.h2_destaques.text).to eql @resultado[:produtos_em_destaque]
end
