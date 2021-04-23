#language : pt
@autenticacao
Funcionalidade: Autenticação

Contexto:
   Dado que esteja no login

   @login
   Cenário: Realizar login
      Quando realizar login
      Então deverá exibir as informações da conta

   @login_exception
   Esquema do Cenário: Realizar login exception
      Quando realizar login com um usuario inválido '<tipo>'
      Então deverá exibir o '<erro>'

      Exemplos:
         |       tipo       | erro             |
         | Senha incorreta  | Acesso inválido. |
         | E-mail incorreto | Cadastre-se      |

