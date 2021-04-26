#language : pt
@gerenciar_enderecos
Funcionalidade: Endereço

Contexto:
    Dado que esteja logado
    E que esteja no cadastro de endereço

    @excluir_endereco
    Cenário: Excluir
        Quando excluir o segundo endereço
        Então deverá exibir a mensagem de sucesso "O endereço foi removido com sucesso!"

