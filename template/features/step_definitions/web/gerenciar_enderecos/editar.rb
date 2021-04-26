Dado('que esteja na edição de endereço') do
  @meus_dados_page= $web_pages.meus_dados
  @endereco_page = $web_pages.endereco
  @meus_dados_page.acessar_gerenciar_enderecos
  @meus_dados_page.acessar_edicao_primeiro_endereco
end

Quando('editar os dados do endereço') do
  @endereco_page.adicionar_novo_endereco
end

Quando('editar os dados do endereço com dados inválidos {string}') do |tipo|
  @tipo = tipo
  @endereco_page.adicionar_novo_endereco_exception(@tipo)
end
