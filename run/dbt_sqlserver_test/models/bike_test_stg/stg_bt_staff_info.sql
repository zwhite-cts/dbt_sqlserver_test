
    USE [testDB];
    execute('create view "dbt"."stg_bt_staff_info__dbt_tmp" as
        with staffs as (

    select * from "testDB"."dbt"."base_bt_sales_staffs"
  
),

stores as (

    select * from "testDB"."dbt"."base_bt_sales_stores"
  
),

final_staff_cte as (
    select
    staffs.staff_id,
    staffs.first_name, 
    staffs.last_name, 
    staffs.email, 
    staffs.phone, 
    staffs.active,
    staffs.manager_id,
    manager.first_name as manager_first_name, 
    manager.last_name as manager_last_name, 
    manager.email as manager_email, 
    manager.phone as manager_phone, 
    manager.active as manager_active,
    manager.manager_id as manager_manager_id,
    stores.store_id,
    stores.store_name, 
    stores.phone as store_phone, 
    stores.email as store_email, 
    stores.street, 
    stores.city, 
    stores.state, 
    stores.zip_code
    from staffs
    left join staffs as manager 
        on manager.staff_id = staffs.manager_id
    left join stores
        on stores.store_id = staffs.store_id
)

select * from final_staff_cte
    ');

