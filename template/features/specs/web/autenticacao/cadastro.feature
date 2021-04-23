#language : pt
@autenticacao
Funcionalidade: Autenticação

Contexto:
   Dado que esteja no cadastro

   @cadastro_usuario_PF
   Cenário: Realizar cadastro de pessoa física
      Quando finalizar o cadastro
      Então deverá exibir a minha conta

   @cadastro_usuario_PF_exception
   Esquema do Cenário: Realizar cadastro de pessoa física exception
      Quando preencher o cadastro com dados inválidos '<tipo>'
      Então deverá exibir o alerta '<erro>'

      Exemplos:
         |       tipo          |                erro                    |
         | Campos obrigatórios | * Este campo é obrigatório             |
         | Nome curto          | * Permitido o mínimo de 3 caractere(s) |
         | Sobrenome curto     | * Permitido o mínimo de 3 caractere(s) |
         | CPF inválido        | * Informe um CPF válido                |
         | E-mail inválido     | * Endereço de email inválido           |
         | Senha curta         | * Permitido o mínimo de 4 caractere(s) |
         | Senha diferente     | * Os campos não correspondem           |

   @cadastro_usuario_PJ
   Cenário: Realizar cadastro de pessoa jurídica
      E que esteja na aba de pessoa jurídica
      Quando finalizar o cadastro PJ
      Então deverá exibir as informações da nova conta

   @cadastro_usuario_PJ_exception
   Esquema do Cenário: Realizar cadastro de pessoa jurídica exception
      E que esteja na aba de pessoa jurídica
      Quando preencher o cadastro PJ com dados inválidos '<tipo>'
      Então deverá exibir o alerta PJ '<erro>'

      Exemplos:
         |       tipo          |                erro                    |
         | Campos obrigatórios | * Este campo é obrigatório             |
         | Nome curto          | * Permitido o mínimo de 3 caractere(s) |
         | Sobrenome curto     | * Permitido o mínimo de 3 caractere(s) |
         | CNPJ inválido       | * Informe um CNPJ válido               |
         | E-mail inválido     | * Endereço de email inválido           |
         | Senha curta         | * Permitido o mínimo de 4 caractere(s) |
         | Senha diferente     | * Os campos não correspondem           |
         | Razão social curta  | * Permitido o mínimo de 3 caractere(s) |
