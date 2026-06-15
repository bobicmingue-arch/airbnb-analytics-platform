{{ config(materialized='view') }}

SELECT
    id                                                      AS listing_id,
    listing_url,
    name                                                    AS listing_name,
    host_id,
    room_type,
    CAST(minimum_nights AS INTEGER)                         AS minimum_nights,
    CAST(REPLACE(REPLACE(price, '$', ''), ',', '') AS FLOAT) AS price,
    created_at,
    updated_at
FROM {{ ref('bronze_listings') }}
