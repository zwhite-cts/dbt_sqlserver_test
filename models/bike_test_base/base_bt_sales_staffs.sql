with source as (
      select * from {{ source('bt_sales', 'staffs') }}
),
renamed as (
    select
        {{ adapter.quote("staff_id") }},
        {{ adapter.quote("first_name") }},
        {{ adapter.quote("last_name") }},
        {{ adapter.quote("email") }},
        {{ adapter.quote("phone") }},
        {{ adapter.quote("active") }},
        {{ adapter.quote("store_id") }},
        {{ adapter.quote("manager_id") }}

    from source
)
select * from renamed
  