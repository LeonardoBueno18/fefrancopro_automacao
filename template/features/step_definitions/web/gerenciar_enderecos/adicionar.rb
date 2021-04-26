Dado('que esteja no cadastro de endereço') do
  @meus_dados_page= $web_pages.meus_dados
  @endereco_page = $web_pages.endereco
  @meus_dados_page.acessar_gerenciar_enderecos
end

Quando('finalizar o cadastro de endereço') do
  @meus_dados_page.acessar_cadastro_novo_endereco
  @endereco_page.adicionar_novo_endereco
end
Quando('preencher o cadastro de endereço com dados inválidos {string}') do |tipo|
  sleep 1
  @meus_dados_page.acessar_cadastro_novo_endereco
  @tipo = tipo
  @endereco_page.adicionar_novo_endereco_exception(@tipo)
end

Então('deverá exibir o novo endereço como primeiro da lista') do
  expect(@endereco_page.retorna_nome_endereco).to have_content @endereco_page.retorna_comparativo_nome_endereco
end

Então('deverá exibir o erro {string} no cadastro de endereço') do |retorno|
  #print @meus_dados_page.retorna_erros_cadastrais_endereco(@tipo)
  expect(@endereco_page.retorna_erros_cadastrais_endereco(@tipo)).to eql retorno
end
