#language : pt
@resumo
Funcionalidade: Resumo

Contexto:
    Dado que esteja logado
    E que possua um item no carrinho de compras
    E que esteja na tela de checkout

    @cupom_desconto @paralelo
    Cenário: Cupom
        Quando informar o cupom válido
        Então deverá exibir o desconto

    @cupom_desconto_exception @paralelo
    Esquema do Cenário: Cupom exception
        Quando informar o cupom inválido '<tipo>'
        Então deverá exibir o retorno '<erro>' do cupom

        Exemplos:
            |     tipo      |            erro             |
            |   Expirado    | Cupom inválido ou expirado. |
            | Não existente | Cupom inválido ou expirado. |
