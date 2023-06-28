with source as (
      select * from {{ source('bt_sales', 'orders') }}
),
renamed as (
    select
        {{ adapter.quote("order_id") }},
        {{ adapter.quote("customer_id") }},
        {{ adapter.quote("order_status") }},
        {{ adapter.quote("order_date") }},
        {{ adapter.quote("required_date") }},
        {{ adapter.quote("shipped_date") }},
        {{ adapter.quote("store_id") }},
        {{ adapter.quote("staff_id") }}

    from source
)
select * from renamed
  