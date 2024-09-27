# Projeto de Data Cleaning usando MySQL.

## Descrição:

- Este projeto realiza o processo de limpeza de um conjunto de dados brutos utilizando SQL em um banco de dados MySQL. O objetivo é remover valores nulos, duplicados, normalizar colunas e padronizar o formato dos dados.

## Objetivos do Projeto:

- Remover duplicatas.
- Lidar com valores nulos.
- Corrigir erros de tipo de dados.
- Normalizar formatos de data.
- Padronizar valores categóricos.

## Como testar o projeto

- Clone o repositório.
- Importe o arquivo de dados em um banco de dados MySQL.
- Execute os scripts SQL na pasta sql-scripts na ordem fornecida.

## Processo de Limpeza de Dados:

- clean_duplicates.sql – Remove duplicatas da tabela de vendas.
- handle_nulls.sql – Substitui valores nulos por valores padrão ou remove as linhas.
- normalize_dates.sql – Converte todas as datas para o formato padrão YYYY-MM-DD.
- standardize_categories.sql – Padroniza valores em colunas categóricas (por exemplo, corrige capitalização inconsistente).
