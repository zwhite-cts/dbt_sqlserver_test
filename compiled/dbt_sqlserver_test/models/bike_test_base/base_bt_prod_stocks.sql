with source as (
      select * from "testDB"."production"."stocks"
),
renamed as (
    select
        "store_id",
        "product_id",
        "quantity"

    from source
)
select * from renamed