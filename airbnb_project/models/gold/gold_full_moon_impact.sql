{{ config(materialized='table') }}

SELECT
    CASE 
        WHEN f.full_moon_date IS NOT NULL THEN 'Pleine Lune'
        ELSE 'Nuit Normale'
    END                         AS night_type,
    COUNT(r.review_date)        AS total_reviews,
    COUNT(CASE WHEN r.sentiment = 'positive' THEN 1 END) AS positive_reviews,
    COUNT(CASE WHEN r.sentiment = 'negative' THEN 1 END) AS negative_reviews,
    ROUND(COUNT(CASE WHEN r.sentiment = 'positive' THEN 1 END) * 100.0 / COUNT(*), 2) AS positive_rate
FROM {{ ref('silver_reviews') }} r
LEFT JOIN {{ ref('silver_full_moon_dates') }} f
    ON r.review_date = f.full_moon_date
GROUP BY night_type
ORDER BY night_type
