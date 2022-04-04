{{ config(materialized='table') }}

select distinct o_orderdate, count(o_orderdate) over(order by o_orderdate range between unbounded preceding and current row) as order_cum
from "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."ORDERS" 
order by o_orderdate

