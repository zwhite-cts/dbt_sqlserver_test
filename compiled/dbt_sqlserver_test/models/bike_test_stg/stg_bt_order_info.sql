with customers as (

    select * from "testDB"."dbt"."base_bt_sales_customers"
  
),

order_items as (

    select * from "testDB"."dbt"."base_bt_sales_order_items"
  
),

orders as (

    select * from "testDB"."dbt"."base_bt_sales_orders"
  
),

staffs as (

    select * from "testDB"."dbt"."stg_bt_staff_info"
  
),

final_orders_cte as (
    select
    orders.order_id, 
    orders.customer_id, 
    orders.order_status, 
    orders.order_date, 
    orders.required_date, 
    orders.shipped_date,
    order_items.item_id, 
    order_items.product_id, 
    order_items.quantity, 
    order_items.list_price, 
    order_items.discount,
    customers.first_name as customer_first_name, 
    customers.last_name as customer_last_name, 
    customers.phone as customer_phone, 
    customers.email as customer_email, 
    customers.street as customer_street, 
    customers.city as customer_city, 
    customers.state as customer_state, 
    customers.zip_code as customer_zip_code,
    staffs.*
    from orders
    left join order_items 
        on order_items.order_id = orders.order_id
    left join customers 
        on customers.customer_id = orders.customer_id
    left join staffs
        on staffs.staff_id = orders.staff_id and staffs.store_id = orders.store_id
)

select * from final_orders_cte