
    USE [testDB];
    execute('create view "dbt"."base_bt_sales_staffs__dbt_tmp" as
        with source as (
      select * from "testDB"."sales"."staffs"
),
renamed as (
    select
        "staff_id",
        "first_name",
        "last_name",
        "email",
        "phone",
        "active",
        "store_id",
        "manager_id"

    from source
)
select * from renamed
    ');

