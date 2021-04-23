#language : pt
@listagem
Funcionalidade: Listagem

Contexto:
    Dado que esteja na home

    @categoria_produto
    Esquema do Cenário: Categoria
        Quando selecionar a categoria '<tipo>'
        Então deverá exibir a lista de produtos correspondentes a categoria

        Exemplos:
            |       tipo        |
            |    ACESSÓRIOS     |
            | BERMUDA \| SHORTS |
            |      BONÉ         |
            |      CALÇA        |
            |    CAMISETAS      |
            |    FEMININA       |
            |   MARMITEIRA      |
            |     MOCHILA       |
            |     MOLETON       |
            |     MONSTER       |
            |     REGATAS       |
