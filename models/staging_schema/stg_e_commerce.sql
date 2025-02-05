{{ config(materialized= 'table', schema= 'staging_schema')}}


with commerce as (
select * from {{ source('raw_schema', 'e_commerce')}}
)
--select * from commerce

select order_id,
        TO_TIMESTAMP(CAST(order_date AS DATE) || ' ' || CAST(time AS TIME)) as order_date,
        aging,
        customer_id,
        gender,
        device_type,
        customer_login_type,
        product_category,
        product,
        sales,
        quantity,
        discount,
        profit,
        shipping_cost,
        order_priority,
        payment_method
from commerce