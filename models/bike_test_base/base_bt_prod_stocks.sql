with source as (
      select * from {{ source('bt_prod', 'stocks') }}
),
renamed as (
    select
        {{ adapter.quote("store_id") }},
        {{ adapter.quote("product_id") }},
        {{ adapter.quote("quantity") }}

    from source
)
select * from renamed
  