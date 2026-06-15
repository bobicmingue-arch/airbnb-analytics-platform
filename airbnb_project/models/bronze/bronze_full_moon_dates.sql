{{ config(materialized='view') }}

SELECT *
FROM read_csv_auto('{{ env_var("DBT_DATA_PATH", "../data") }}/seed_full_moon_dates.csv')
