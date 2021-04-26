#language : pt
@pagamento
Funcionalidade: Pagamento

Contexto:
  Dado que esteja logado
  E que possua um item no carrinho de compras
  E que esteja na tela de checkout

  @cartao_de_credito
  Cenário: Pagar com Cartão de crédito
    Quando selecionar o método cartão de crédito
    E preencher os dados válidos do cartão
    Então deverá exibir o resumo da compra

  @cartao_de_credito_exception
  Esquema do Cenário: Pagar com Cartão de crédito exception
    Quando selecionar o método cartão de crédito
    E preencher os dados inválidos do cartão '<tipo>'
    Então deverá exibir o retorno '<erro>' na finalização da compra

    Exemplos:
         | tipo                      | erro                                   |
         | Campos obrigatórios       | * Este campo é obrigatório             |
         | Número do Cartão inválido | * Favor selecionar uma opção           |
         | Código de segurança curto | * Permitido o mínimo de 3 caractere(s) |
