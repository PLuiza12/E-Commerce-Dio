# **Refinando um Projeto Conceitual de Banco de Dados - E-Commerce** 

## Objetivo:
Refinar o modelo apresentado acrescentando os seguintes pontos:

- Cliente PJ e PF - Uma conta pode ser PJ ou PF, mas não pode ter as duas informações:
  Foi criada uma entidade chamada Cliente na qual o cliente poderá optar por ser Pj ou PF e cada uma
  possui sua particulariedade descrita para a distinção das mesmas.

- Pagamento - Pode ser cadastrado mais de uma forma de pagamento:
  Foi criada uma entidade chamada Pagamento na qual, contém seus atributos sobre qual forma de pagamento
  o cliente poderá optar para realizar o pagamento do pedido.

- Entrega - Possui status e código de rastreio:
  Foi criada duas entidades, uma com o nome de *Relação Pedido/Transportadora propria* na qual a mesma possui uma entidade
  chamada *Transportadora Propria* que contém os atributos como status do pedido, endereço de entrega, dentre outros atributos.
  Contudo se cliente optar por outro tipo de transportadora teremos a entidade *Relação Pedido/
  Transportadora terceira* que possui uma entidade chamada *Transportadora Terceira* que possui atributos como status do pedido e endereço de entrega, dentre outros atributos.
  
  


