#language : pt
@dadoscadastrais
Funcionalidade: Dados Cadastrais

Contexto:
    Dado que esteja logado
    E na tela de edição de dados cadastrais

    @editar_cadastro
    Cenário: Editar cadastro pessoa física
        Quando editar os dados cadastrais
        Então deverá exibir os dados cadastrais atualizados

   @editar_cadastro_exception
   Esquema do Cenário: Editar cadastro pessoa física exception
        Quando editar os dados cadastrais com dados inválidos '<tipo>'
        Então deverá exibir o alerta na alteração cadastral '<erro>'

        Exemplos:
            |       tipo          |                erro                    |
            | Campos obrigatórios | * Este campo é obrigatório             |
            | Nome curto          | * Permitido o mínimo de 3 caractere(s) |
            | Sobrenome curto     | * Permitido o mínimo de 3 caractere(s) |
            | CPF inválido        | * Informe um CPF válido                |

