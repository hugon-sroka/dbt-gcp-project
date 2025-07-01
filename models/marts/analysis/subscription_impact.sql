-- models/marts/analysis/subscription_impact.sql
{{
  config(
    materialized='table'
  )
}}

SELECT
  Subscription_Status,
  COUNT(*) AS order_count,
  SUM(CAST(Purchase_Amount__USD_ AS NUMERIC)) AS total_revenue,
  ROUND(AVG(CAST(Purchase_Amount__USD_ AS NUMERIC)), 2) AS avg_order_value,
  SUM(CAST(Previous_Purchases AS INT64)) AS lifetime_purchases,
  ROUND(AVG(CAST(Previous_Purchases AS INT64)), 1) AS avg_previous_purchases
FROM {{ source('gcp_shopping_data', 'shopping_trends_updated') }}
GROUP BY Subscription_Status