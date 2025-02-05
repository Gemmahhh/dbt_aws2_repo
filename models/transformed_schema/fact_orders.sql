{{ config(schema= 'transformed_schema', unique_key = 'order_id') }}

with orders as (
select * from {{ ref('stg_e_commerce')}}
)

select 
    order_id,
    order_date,
    product,
    order_priority,
    customer_id,
    payment_method,
    shipping_cost,
    quantity,
    sales,
    discount,
    profit
from orders
