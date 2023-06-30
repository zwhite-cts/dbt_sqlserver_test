
    USE [testDB];
    execute('create view "dbt"."base_bt_prod_products__dbt_tmp" as
        with source as (
      select * from "testDB"."production"."products"
),
renamed as (
    select
        "product_id",
        "product_name",
        "brand_id",
        "category_id",
        "model_year",
        "list_price"

    from source
)
select * from renamed
    ');

