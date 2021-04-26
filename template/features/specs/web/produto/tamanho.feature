#language : pt
@produto
Funcionalidade: Produto

Contexto:
    Dado que esteja na página de informações do produto

    @tamanho_produto @paralelo
    Cenário: Tamanho
        Quando selecionar o tamanho do produto '<tipo>'
        Então deverá informar a disponibilidade

        Exemplos:
            | tipo |
            |  P   |
            |  M   |
            |  G   |
            |  GG  |
