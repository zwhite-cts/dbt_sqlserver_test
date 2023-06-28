with source as (
      select * from {{ source('bt_sales', 'stores') }}
),
renamed as (
    select
        {{ adapter.quote("store_id") }},
        {{ adapter.quote("store_name") }},
        {{ adapter.quote("phone") }},
        {{ adapter.quote("email") }},
        {{ adapter.quote("street") }},
        {{ adapter.quote("city") }},
        {{ adapter.quote("state") }},
        {{ adapter.quote("zip_code") }}

    from source
)
select * from renamed
  