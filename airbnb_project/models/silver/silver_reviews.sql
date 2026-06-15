{{ config(materialized='view') }}

SELECT
    listing_id,
    CAST(date AS DATE)  AS review_date,
    reviewer_name,
    comments,
    sentiment
FROM {{ ref('bronze_reviews') }}
WHERE comments IS NOT NULL
