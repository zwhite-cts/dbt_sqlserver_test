
    USE [testDB];
    execute('create view "dbt"."base_bt_sales_stores__dbt_tmp" as
        with source as (
      select * from "testDB"."sales"."stores"
),
renamed as (
    select
        "store_id",
        "store_name",
        "phone",
        "email",
        "street",
        "city",
        "state",
        "zip_code"

    from source
)
select * from renamed
    ');

