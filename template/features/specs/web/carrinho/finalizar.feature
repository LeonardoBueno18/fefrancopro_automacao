#language : pt
@carrinho
Funcionalidade: Carrinho

Contexto:
    Dado que esteja logado
    E que possua um item no carrinho de compras

    @finalizar_compra
    Cenário: Finalizar compra
       Quando finalizar a compra
       Então deverá exibir a tela de seleção de destino
