#language : pt
@gerenciar_enderecos
Funcionalidade: Endereço

Contexto:
    Dado que esteja logado
    E que esteja no cadastro de endereço

    @adicionar_endereco
    Cenário: Adicionar endereço
        Quando finalizar o cadastro de endereço
        Então deverá exibir o novo endereço como primeiro da lista

    @adicionar_endereco_exception
    Esquema do Cenário: Adicionar endereço exception
        Quando preencher o cadastro de endereço com dados inválidos '<tipo>'
        Então deverá exibir o erro '<erro>' no cadastro de endereço

        Exemplos:
            |       tipo          |                erro                    |
            | Campos obrigatórios | * Este campo é obrigatório             |
            | Nome curto          | * Permitido o mínimo de 3 caractere(s) |
            | Sobrenome curto     | * Permitido o mínimo de 3 caractere(s) |
