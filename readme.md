### Projeto de software - UTFPR

#### Gestão de salão de beleza

#### Integrantes:
  - Cesar Mauricio Chauchuty
  - Jucinaldo Araujo (RA-2296500)
  - Murilo  Szulha
  - Marcos Soek

#### Objetivo
Desenvolver um sistema de gestão de salão de beleza, que  permita ao usuário executar as operações CRUD de clientes, serviços e agendamentos.

#### Cronograma

| DATA       |             Descrição            |
|------------|----------------------------------|
| 07/03/2022 | Início do projeto                |
| 07/04/2022 | Escolha da proposta              |
| 07/04/2022 | Pesquisa da temática             |
| 16/03/2022 | Definição das etapas do projeto  |
| 16/03/2022 | Desenvolvimento do protótipo     |
| 26/03/2022 | Desenvolvimento de caso de uso   |

#### Database
```sql
Table profissional as PRO {
  id int [pk, increment]
  nome varchar [not null]
  data_nasc date [not null]
  cpf varchar [not null, unique]
  email varchar [unique]
  telefone varchar [unique]
  endereco varchar [not null]
}

Table cliente as CLI {
  id int [pk, increment]
  nome varchar [not null]
  email varchar [unique]
  telefone varchar [unique]
  endereco varchar
  fk_convenio int
}

Table convenio as CON {
  id int [pk, increment]
  nome varchar [not null]
  descricao varchar 
  desconto decimal [not null]
}

Table servico as SER {
  id int [pk, increment]
  nome varchar [not null]
  descricao varchar
  valor double
}

Table agendamento_servico as AGE_SER {
  id int [pk, increment]
  fk_agendamento int [not null]
  fk_servico int [not null]
}

Table agendamento as AGE {
  id int [pk, increment]
  data_inicio date [not null]
  data_fim date [not null]
  fk_cliente int [not null]
  fk_profissional int [not null]
  fk_agendamento_servico int [not null]
}

Table pagamento as PAG {
  id int [pk, increment]
  valor double [not null]
  status tinyint [default: 0]
  fk_agendamento int [not null]
}
```
