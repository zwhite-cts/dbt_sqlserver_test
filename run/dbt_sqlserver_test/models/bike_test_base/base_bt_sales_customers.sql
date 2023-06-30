
    USE [testDB];
    execute('create view "dbt"."base_bt_sales_customers__dbt_tmp" as
        with source as (
      select * from "testDB"."sales"."customers"
),
renamed as (
    select
        "customer_id",
        "first_name",
        "last_name",
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

