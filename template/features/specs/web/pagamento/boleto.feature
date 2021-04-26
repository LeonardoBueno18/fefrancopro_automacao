#language : pt
@pagamento
Funcionalidade: Pagamento

Contexto:
    Dado que esteja logado
    E que possua um item no carrinho de compras
    E que esteja na tela de checkout

  @boleto
  Cenário: Gerar boleto
    Quando selecionar o método boleto
    Então deverá gerar um boleto
