with source as (
      select * from {{ source('bt_prod', 'brands') }}
),
renamed as (
    select
        {{ adapter.quote("brand_id") }},
        {{ adapter.quote("brand_name") }}

    from source
)
select * from renamed
  