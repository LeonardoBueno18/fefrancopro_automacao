#language : pt
@gerenciar_enderecos
Funcionalidade: Endereço

Contexto:
    Dado que esteja logado
    E que esteja na edição de endereço

    @editar_endereco
    Cenário: Editar endereço
        Quando editar os dados do endereço
        Então deverá exibir o novo endereço como primeiro da lista

    @editar_endereco_exception
    Esquema do Cenário: Editar endereço exception
        Quando editar os dados do endereço com dados inválidos '<tipo>'
        Então deverá exibir o erro '<erro>' no cadastro de endereço

        Exemplos:
            |       tipo          |                erro                    |
            | Campos obrigatórios | * Este campo é obrigatório             |
            | Nome curto          | * Permitido o mínimo de 3 caractere(s) |
            | Sobrenome curto     | * Permitido o mínimo de 3 caractere(s) |
