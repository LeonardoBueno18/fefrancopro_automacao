#language : pt
@listagem
Funcionalidade: Listagem

Contexto:
    Dado que esteja na home

    @busca_produto
    Esquema do Cenário: Busca
        Quando realizar uma busca por '<termo>'
        Então deverá exibir a lista de produtos correspondentes

        Exemplos:
          | termo     |
          | camisetas |
          | regatas   |
