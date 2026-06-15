{{ config(materialized='table') }}

SELECT
    h.host_id,
    h.host_name,
    h.is_superhost,
    COUNT(l.listing_id)         AS total_listings,
    ROUND(AVG(l.price), 2)      AS avg_price,
    MIN(l.price)                AS min_price,
    MAX(l.price)                AS max_price
FROM {{ ref('silver_hosts') }} h
LEFT JOIN {{ ref('silver_listings') }} l
    ON h.host_id = l.host_id
GROUP BY h.host_id, h.host_name, h.is_superhost
ORDER BY total_listings DESC
