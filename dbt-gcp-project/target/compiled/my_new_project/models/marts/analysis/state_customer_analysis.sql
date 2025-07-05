

SELECT 
    Location AS state,
    count(distinct Customer_ID) as unique_customers,
    round(AVG(CAST(AGE AS INT64)),1)as avg_age,
    SUM(CAST(Previous_Purchases as INT64)) as total_previous_purchases,
    ROUND(SUM(CAST(Previous_Purchases as INT64))/COUNT(distinct Customer_ID), 1) as avg_purchases_per_customer
FROM `my-dbt-project-4321790`.`shopping_sales`.`shopping_trends_updated`
GROUP BY Location
Order By avg_purchases_per_customer DESC