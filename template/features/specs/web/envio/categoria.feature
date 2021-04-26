#language : pt
@envio
Funcionalidade: Envio

Contexto:
    Dado que esteja logado
    E que possua um item no carrinho de compras
    E que esteja na tela de checkout

    @selecionar_envio
    Cenário: Selecionar envio
        Quando selecionar a segunda categoria de envio
        Então deverá exibir o prazo de entrega
