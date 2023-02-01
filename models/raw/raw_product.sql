{{
    config(
        materialized='table'
    )
}}

select * from {{ source('GlobalMart', 'product') }}