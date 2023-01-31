{{
    config(
        materialized='table'
    )
}}
select
--from raw_orders
orderid,
orderdate,
shipdate,
shipmode,
o.customerid,
o.productid,

--from raw_customer
c.customername,
c.segment,
c.country,
--from raw_product
p.category,
p.productname,
p.subcategory,
ordersellingprice,
ordercostprice,
ordersellingprice - ordercostprice as orderprofit
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customer') }} as c
on o.customerid=c.customerid    
left join {{ ref('raw_product') }}  as p
on o.productid=p.productid