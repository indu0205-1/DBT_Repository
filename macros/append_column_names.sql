{% macro append_column_names() %}
{% set columns_list = ['listing_id','listing_name','listing_url','room_type', 'minimum_nights','host_id'] %}

SELECT

{%- for col in columns_list %}
  {{col}} {% if not loop.last %} ,  {% endif -%}
{% endfor -%}

FROM {{ ref('dim_listings_cleansed') }}

{% endmacro %}