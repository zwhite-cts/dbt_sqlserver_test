with source as (
      select * from {{ source('bt_sales', 'order_items') }}
),
renamed as (
    select
        {{ adapter.quote("order_id") }},
        {{ adapter.quote("item_id") }},
        {{ adapter.quote("product_id") }},
        {{ adapter.quote("quantity") }},
        {{ adapter.quote("list_price") }},
        {{ adapter.quote("discount") }}

    from source
)
select * from renamed
  