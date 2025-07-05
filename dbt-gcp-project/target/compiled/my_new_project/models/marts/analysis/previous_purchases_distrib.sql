

WITH source_data AS (
  SELECT
    customer_id,
    previous_purchases
  FROM `my-dbt-project-4321790`.`shopping_sales`.`shopping_trends_updated`
)

SELECT
  COUNT(*) as customer_count,
  AVG(previous_purchases) as avg_purchases,
  STDDEV(previous_purchases) as stddev_purchases,
  APPROX_QUANTILES(previous_purchases, 100)[OFFSET(25)] as p25,
  APPROX_QUANTILES(previous_purchases, 100)[OFFSET(50)] as median,
  APPROX_QUANTILES(previous_purchases, 100)[OFFSET(75)] as p75,
  APPROX_QUANTILES(previous_purchases, 100)[OFFSET(90)] as p90
FROM source_data