{{ config(materialized= 'table', schema= 'transformed_schema') }}

with product as (
select * from {{ ref('stg_e_commerce')}}
),

intermediate_select as (
select 
    distinct product as product_name,
    product_category
from product
)

select 
    ROW_NUMBER() OVER (ORDER BY product_name) AS id,
    product_name,
    product_category
from intermediate_select
