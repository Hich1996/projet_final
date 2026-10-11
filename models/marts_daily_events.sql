{{ config(materialized='table') }}

SELECT 
    DATE(event_timestamp) AS event_date,
    device_category,
    COUNT(event_id) AS total_events
FROM {{ ref('stg_web_events') }}
GROUP BY 1, 2