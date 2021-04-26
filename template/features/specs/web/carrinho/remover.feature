#language : pt
@carrinho
Funcionalidade: Carrinho

Contexto:
    Dado que possua um item no carrinho de compras
    E que esteja na tela do carrinho de compras

    @remover_compra
    Cenário: Remover compra
       Quando remover o primeiro produto
       Então deverá exibir o retorno do carrinho 'SEU CARRINHO DE COMPRAS ESTÁ VAZIO'
