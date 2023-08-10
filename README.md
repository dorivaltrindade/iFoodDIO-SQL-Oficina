iFoodDIO-SQL_oficina
# DESAFIO

## Atividade de modelagem de um banco de dados para oficina

#### PROTÓTIPO DE UM SISTEMA PARA OFICINA

### Possíveis ações dos operadores do sistema:

---

## 1. Realizar o cadastro prévio:
    
    a. dos produtos químicos usados pela oficina durante a execução dos serviços
    b. das peças que se propõe a comprar para execução dos serviços
    c. dos serviços propriamente ditos para os quais a oficina se define como capaz de realizar
    d. dos funcionários e suas respectivas funções
    
---
## 2. Realizar o cadastro complementar no ato do atendimento:
    
    a. dados dos veículos
    b. dados para o orçamento
    c. dados para as ordens de serviços envolvidas no orçamento
    d. dados para os serviços envolvidos nas ordens de serviços
    e. dados para os produtos utilizados nas ordens de serviços
    f. dados para as peças utilizadas nas ordens de serviços
    
---
## 3. A modelagem do banco de dados responde ao seguinte caso de uso:
    
    O responsável pelo veículo dirige até a oficina e apresenta sua(s) necessidade(s)/queixa(s).
    O Supervisor encaminha o veículo para o funcionário adequado à situação.
    Constatadas as causas do problema e a necessária solução, abre-se o orçamento, preenche-se quantas OS forem necessárias para que o problemas seja solucionado.
    Para cada OS, um conjunto de registros de serviço, peça e produto para cada etapa da implementação da solução.
    Conclui-se o levantamento de todos os custos e termina-se o preenchimento do orçamento para que o responsável pelo veículo o aprove ou reprove.
    Uma vez aprovado, procede-se ao pagamento e defini-se a agenda de data de início e data de término do atendimento para a entrega do veículo no dia marcado.
    
---

## 4. Foram construídas várias QUERIES para responder às seguintes perguntas/relatórios:
    
    [01] Quantos veículos foram conduzidos para atendimento na oficina agrupados por data de entrada?
    [02] Quantos orçamentos foram aprovados?
    [03] Qual é o faturamento da oficina?
    [04] Quantos veículos por marca foram conduzidos para orçamento na oficina?
    [05] Relação de atividades por veículo (Veiculo + Orcamento + OrdemServico + Servico + Peca + Produto).
    [06] Qual é o orçamento com o maior número de tipos de peças?
    [07] Qual é o orçamento com o maior número de serviços?
    [08] Relação do número de produtos por orçamento?
    [09] Qual funcionário está mais envolvido com a execução das ordem de serviços?
    [10] Qual é média de quilometragem rodada por ano para cada veículo?
    [11] Recuperações simples com SELECT statement:

---

### Sinta-se livre para experimetar as soluções aqui apresentadas.