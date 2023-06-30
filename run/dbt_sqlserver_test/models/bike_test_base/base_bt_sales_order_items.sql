
    USE [testDB];
    execute('create view "dbt"."base_bt_sales_order_items__dbt_tmp" as
        with source as (
      select * from "testDB"."sales"."order_items"
),
renamed as (
    select
        "order_id",
        "item_id",
        "product_id",
        "quantity",
        "list_price",
        "discount"

    from source
)
select * from renamed
    ');

