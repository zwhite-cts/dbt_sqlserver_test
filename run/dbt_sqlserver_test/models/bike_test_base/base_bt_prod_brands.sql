
    USE [testDB];
    execute('create view "dbt"."base_bt_prod_brands__dbt_tmp" as
        with source as (
      select * from "testDB"."production"."brands"
),
renamed as (
    select
        "brand_id",
        "brand_name"

    from source
)
select * from renamed
    ');

