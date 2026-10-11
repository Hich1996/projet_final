{{ config(materialized='table') }}

WITH raw_ga4_export AS (
    -- Simulation avec un paramètre texte et un paramètre chiffre
    SELECT 
        'session_123' AS user_pseudo_id,
        'page_view' AS event_name,
        [
            STRUCT('page_location' AS key, 'https://mon-site.com/promo' AS string_value, NULL AS int_value),
            STRUCT('source' AS key, 'google' AS string_value, NULL AS int_value),
            STRUCT('ga_session_id' AS key, NULL AS string_value, 123456789 AS int_value)
        ] AS event_params
)

SELECT 
    user_pseudo_id,
    event_name,
    -- Utilisation de ta nouvelle macro pour le texte (type string par défaut) :
    {{ unnest_param('page_location') }} AS page_location,
    {{ unnest_param('source') }} AS utm_source,
    
    -- Utilisation de ta macro pour le nombre (on précise le type int) :
    {{ unnest_param('ga_session_id', value_type='int') }} AS session_id
FROM raw_ga4_export