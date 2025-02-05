{{ config(materialized= 'table', schema= 'transformed_schema') }}

with customer as (
select * from {{ ref('stg_e_commerce')}}
)

select 
    customer_id,
    gender
from customer
