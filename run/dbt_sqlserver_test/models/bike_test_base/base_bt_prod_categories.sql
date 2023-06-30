
    USE [testDB];
    execute('create view "dbt"."base_bt_prod_categories__dbt_tmp" as
        with source as (
      select * from "testDB"."production"."categories"
),
renamed as (
    select
        "category_id",
        "category_name"

    from source
)
select * from renamed
    ');

