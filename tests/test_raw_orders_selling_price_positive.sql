with orders as (

    select * from {{ ref('raw_orders') }}
)
select orderid,sum(ordersellingprice) from orders group by 1 having sum(ordersellingprice)<=0