
    USE [testDB];
    execute('create view "dbt"."stg_bt_product_info__dbt_tmp" as
        with brands as (

    select * from "testDB"."dbt"."base_bt_prod_brands"
  
),

categories as (

    select * from "testDB"."dbt"."base_bt_prod_categories"
  
),

products as (

    select * from "testDB"."dbt"."base_bt_prod_products"
  
),

final_product_cte as (
    select
    products.product_id, 
    products.product_name, 
    products.brand_id, 
    products.category_id, 
    products.model_year, 
    products.list_price,
    categories.category_name,
    brands.brand_name
    from products 
    left join categories 
        on categories.category_id = products.category_id
    left join brands 
        on brands.brand_id = products.brand_id
)

select * from final_product_cte
    ');

