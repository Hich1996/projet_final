WITH historique_achats AS (
    SELECT user_id, created_at, 
    LAG(created_at) OVER (
        PARTITION BY user_id
        ORDER BY created_at
    ) AS date_achat_precedent
    FROM {{ref('stg_transactions')}}
)
SELECT DISTINCT user_id
FROM historique_achats
WHERE date_diff (DATE(created_at), DATE(date_achat_precedent), DAY) > 0
AND date_diff (DATE(created_at), DATE(date_achat_precedent), DAY) <= 7