Dado('que esteja no cadastro de endereço') do
  @meus_dados_page= $web_pages.meus_dados
  @meus_dados_page.acessar_gerenciar_enderecos
end

Quando('finalizar o cadastro de endereço') do
  @meus_dados_page.acessar_cadastro_novo_endereco
  @meus_dados_page.adicionar_novo_endereco
end

Então('deverá exibir a lista de endereços atualizada') do
  expect(@meus_dados_page.retorna_nome_endereco).to have_content @meus_dados_page.retorna_comparativo_nome_endereco
end
