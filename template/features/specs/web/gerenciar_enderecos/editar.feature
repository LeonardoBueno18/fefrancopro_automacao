#language : pt
@gerenciarenderecos
Funcionalidade: Endereço

Contexto:
    Dado que esteja logado
    E que esteja na edição de endereço

    @editar_endereco
    Cenário: Editar endereço
        Quando editar os dados do endereço
        Então deverá exibir a lista atualizada

    @editar_endereco_exception
    Esquema do Cenário: Editar endereço exception
        Quando editar os dados do endereço com dados inválidos '<tipo>'
        Então deverá exibir o '<erro>'

        Exemplos:
            |       tipo          |                erro                 |
            | Campos obrigatórios | Esses campos são obrigatórios!      |
            | Nome curto          | Permitido o minimo de 3 caracteres! |
            | Sobrenome curto     | Permitido o minimo de 3 caracteres! |
