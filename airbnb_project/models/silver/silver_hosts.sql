{{ config(materialized='view') }}

SELECT
    id          AS host_id,
    name        AS host_name,
    is_superhost,
    created_at  AS host_created_at,
    updated_at  AS host_updated_at
FROM {{ ref('bronze_hosts') }}
