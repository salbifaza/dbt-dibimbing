{{
  config(
    materialized='table'
  )
}}

WITH t_data AS (
SELECT DISTINCT
  Style AS style,
  SKU AS sku,
  Category AS category,
  Size AS size,
FROM
    `data-stack-398710.dibimbing.amazon_sale_report`  -- sesuaikan dengan table kalian

)

SELECT {{ dbt_utils.generate_surrogate_key([
				'sku'
			]) }} as product_id, *
FROM t_data
