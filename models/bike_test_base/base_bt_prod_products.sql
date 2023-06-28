with source as (
      select * from {{ source('bt_prod', 'products') }}
),
renamed as (
    select
        {{ adapter.quote("product_id") }},
        {{ adapter.quote("product_name") }},
        {{ adapter.quote("brand_id") }},
        {{ adapter.quote("category_id") }},
        {{ adapter.quote("model_year") }},
        {{ adapter.quote("list_price") }}

    from source
)
select * from renamed
  