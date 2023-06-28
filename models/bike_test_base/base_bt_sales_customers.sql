with source as (
      select * from {{ source('bt_sales', 'customers') }}
),
renamed as (
    select
        {{ adapter.quote("customer_id") }},
        {{ adapter.quote("first_name") }},
        {{ adapter.quote("last_name") }},
        {{ adapter.quote("phone") }},
        {{ adapter.quote("email") }},
        {{ adapter.quote("street") }},
        {{ adapter.quote("city") }},
        {{ adapter.quote("state") }},
        {{ adapter.quote("zip_code") }}

    from source
)
select * from renamed
  