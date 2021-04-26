#language : pt
@alterar_acesso
Funcionalidade: Alterar acesso

Contexto:
    Dado que esteja logado
    E que esteja na tela de alteração de acesso

    @troca_senha
    Esquema do Cenário: Realizar troca de senha
        Quando editar os dados de acesso
        Então deverá exibir o retorno da atualização de acesso '<retorno>'

        Exemplos:
            |                 retorno                  |
            | Dados de acesso atualizados com sucesso! |


    @troca_senha_exception
    Esquema do Cenário: Realizar troca de senha exception
        Quando preencher os dados de atualização de acesso inválidos '<tipo>'
        Então deverá exibir o alerta de erro na atualização de acesso '<erro>'

        Exemplos:
            |       tipo          |                  erro                  |
            | Senha curta         | * Permitido o mínimo de 4 caractere(s) |
            | Senha diferente     | * Os campos não correspondem           |
