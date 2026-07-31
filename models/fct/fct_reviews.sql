{{ config(
    materialized='incremental',
    incremental_strategy='merge',
    on_schema_change='fail',
    unique_key=['listing_id', 'reviewer_name']
    )
}}

with src_reviews as (
    select * from {{ ref('src_reviews') }}
)
select * from src_reviews
where review_text is not null
{% if is_incremental() %}
AND review_date > (select max(review_date) from {{this}})
{% endif %}