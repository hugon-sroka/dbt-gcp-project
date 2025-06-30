{{
  config(
    materialized='table'
  )
}}

SELECT
  Payment_Method,
  COUNT(*) AS transaction_count,
  SUM(CAST(Purchase_Amount__USD_ AS NUMERIC)) AS total_revenue,
  ROUND(SUM(CAST(Purchase_Amount__USD_ AS NUMERIC)) / COUNT(*), 2) AS avg_order_value,
  ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 1) AS percentage_of_orders
FROM {{ source('gcp_shopping_data', 'shopping_trends_updated') }}
GROUP BY Payment_Method
ORDER BY total_revenue DESC