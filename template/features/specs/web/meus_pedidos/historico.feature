#language : pt
@meus_pedidos
Funcionalidade: Meus Pedidos

Contexto:
   Dado que esteja logado

   @historico_pedidos
   Cenário: Verificar rastreio
      Quando selecionar a aba Visualizar pedidos
      Então deverá exibir o histórico de pedidos
