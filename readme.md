#### Programação de Dispositivos Móveis - UTFPR

#### Integrantes:
  - Cesar Mauricio Chauchuty
  - Jucinaldo Araujo (RA-2296500)
  - Murilo  Szulha
  - Marcos Soek


#### Parte I
- :white_check_mark: Objetivo do Aplicativo
- :white_check_mark: Apresentação do Projeto
- :white_check_mark: Uso de Formulários
- :white_check_mark: Validações e Feedback
- :white_check_mark: Estrutura e Padronização
- :white_check_mark: Navegação entre Páginas
- :white_check_mark: Interface Adequada


### Comando de Instalação
#### Executar os comandos abaixo sequencialmente:

```
git clone https://github.com/chauchuty/projeto-de-software.git
```
```
cd project-de-software
cd flutter_refactoring
flutter run
```
### MVC
![N|Solid](./images/diagram.jpeg)

### User Flow
![N|Solid](./images/user_flow.png)

```sql
Table servico as SER {
  id int [pk, increment]
  nome varchar [not null]
  valor double [not null]
  tempo_medio datetime [not null]
}

Table pacote as PAC {
  id int [pk, increment]
  nome varchar [not null]
  perc_desconto double [not null]
}

Table servico_pacote as SPC {
  id int [pk, increment]
  fk_servico int
  fk_pacote int
}

Table servico_profissional as SEP {
  id int [pk, increment]
  fk_profissional int
  fk_servico int

}

Table cliente as CLI {
  id int [pk, increment]
  nome varchar 
}

Table profissional as PRO {
  id int [pk, increment]
  nome varchar 
  categoria varchar
}

Table agendamento as AGE {
  id int [pk, increment]
  data_inicio datetime
  data_final datetime
  fk_cliente int
  fk_servico int
  fk_pacote int
  status boolean [default: 0]
}

Ref: SEP.fk_profissional > PRO.id 
Ref: SEP.fk_servico > SER.id 
Ref: SPC.fk_servico > SER.id 
Ref: SPC.fk_pacote > PAC.id 
Ref: AGE.fk_cliente > CLI.id 
Ref: AGE.fk_pacote > PAC.id 
```
