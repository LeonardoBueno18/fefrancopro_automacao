#language : pt
@produto
Funcionalidade: Produto

Contexto:
    Dado que esteja na home

    @pagina_do_produto
    Cenário: Página
        Quando selecionar o primeiro produto da categoria camisetas
        Então deverá exibir a página de informações
