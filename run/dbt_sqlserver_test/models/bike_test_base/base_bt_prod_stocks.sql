
    USE [testDB];
    execute('create view "dbt"."base_bt_prod_stocks__dbt_tmp" as
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
    ');

