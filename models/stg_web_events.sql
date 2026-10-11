{{ config(materialized='table') }}

WITH raw_events AS (
    SELECT 1 AS event_id, 'page_view' AS event_name, '2026-10-11 10:00:00' AS event_timestamp, 'desktop' AS device_category, '/home' AS page_path
    UNION ALL
    SELECT 2, 'add_to_cart', '2026-10-11 10:05:00', 'mobile', '/product/tshirt'
    UNION ALL
    SELECT 3, 'purchase', '2026-10-11 10:15:00', 'desktop', '/checkout'
)
SELECT * FROM raw_events