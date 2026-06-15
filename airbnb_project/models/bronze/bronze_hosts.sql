{{ config(materialized='view') }}

SELECT *
FROM read_csv_auto('{{ env_var("DBT_DATA_PATH", "../data") }}/hosts.csv')
