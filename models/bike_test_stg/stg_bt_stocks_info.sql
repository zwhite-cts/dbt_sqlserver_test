with stocks as (

    select * from {{ ref("base_bt_prod_stocks") }}
  
),

stores as (

    select * from {{ ref("base_bt_sales_stores") }}
  
),

product_info as (

    select * from {{ ref("stg_bt_product_info" )}}
  
),

final_stocks_cte as (
    select
    stocks.quantity,
    product_info.*,
    stores.*
    from stocks 
    left join product_info 
        on product_info.product_id = stocks.product_id
    left join stores 
        on stores.store_id = stocks.store_id
)

select * from final_stocks_cte