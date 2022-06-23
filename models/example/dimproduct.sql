{{ config(materialized='table') }}

select 

PRODUCT_ID AS PRODUCTID,
ID AS PRODUCTSOURCEKEY,
PRODUCT_NAME AS PRODUCTNAME,
SEGMENT AS SEGMENT,
SUB_CATEGORY AS SUBCATEGORY,
CATEGORY AS CATEGORY,
_FIVETRAN_SYNCED AS CREATEDDATE,
'fivetran' AS CREATEDBY,
 current_timestamp AS MODIFIEDDATE,
'fivetran' AS MODIFIEDBY

from "DATA_TO_INSIGHTS"."DATA_TO_INSIGHTS_TRAINING"."STG_DIMPRODUCT"

{% if is_incremental() %}
  -- this filter will only be applied on an incremental run
  where cast(_FIVETRAN_SYNCED as date) > (select max(cast(_FIVETRAN_SYNCED as date)) from {{ this }})
{% endif %}
 
