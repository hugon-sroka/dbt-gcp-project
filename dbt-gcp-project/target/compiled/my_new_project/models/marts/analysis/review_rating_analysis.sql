-- models/marts/analysis/review_rating_analysis.sql


WITH rating_buckets AS (
  SELECT
    CASE
      WHEN Review_Rating >= 4.5 THEN '4.5-5.0'
      WHEN Review_Rating >= 4.0 THEN '4.0-4.4'
      ELSE '<4.0'
    END AS rating_group,
    *
  FROM `my-dbt-project-4321790`.`shopping_sales`.`shopping_trends_updated`
)

SELECT
  rating_group,
  Gender,
  Location,
  ROUND(AVG(CAST(Age AS INT64)), 1) AS avg_age,
  COUNT(*) AS review_count,
  ROUND(AVG(CAST(Purchase_Amount__USD_ AS NUMERIC)), 2) AS avg_spend
FROM rating_buckets
GROUP BY rating_group, Gender, Location
ORDER BY rating_group, review_count DESC