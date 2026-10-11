{% macro unnest_param(param_name, value_type='string') %}
    (SELECT {{ value_type }}_value FROM UNNEST(event_params) WHERE key = '{{ param_name }}')
{% endmacro %}