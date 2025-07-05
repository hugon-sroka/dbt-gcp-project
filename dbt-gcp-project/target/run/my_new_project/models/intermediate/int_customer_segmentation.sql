
  
    

    create or replace table `my-dbt-project-4321790`.`shopping_trends_updated`.`int_customer_segmentation`
      
    
    

    
    OPTIONS()
    as (
      

WITH customer_data AS (
  SELECT
    Customer_ID,
    -- Ekstrakcja cech klienta (1 wiersz = 1 klient)
    MAX(CAST(Previous_Purchases AS INT64)) AS lifetime_purchases,
    MAX(CAST(Purchase_Amount__USD_ AS NUMERIC)) AS max_order_value,
    MAX(Review_Rating) AS avg_rating,
    LOGICAL_OR(Subscription_Status = 'Yes') AS is_subscriber
  FROM `my-dbt-project-4321790`.`shopping_sales`.`shopping_trends_updated`
  GROUP BY Customer_ID
)

SELECT
  Customer_ID,
  lifetime_purchases,
  avg_rating,
  is_subscriber,
  -- Segmentacja oparta o statystyki które obliczyłeś wcześniej
  CASE
    WHEN lifetime_purchases >= 38 THEN 'VIP'          -- powyżej p75 (Twoje dane)
    WHEN lifetime_purchases >= 13 THEN 'Returning'    -- między p25 a p75
    ELSE 'New'                                        -- poniżej p25
  END AS customer_segment,
  -- Dodatkowa segmentacja wartościowa
  CASE
    WHEN max_order_value > 100 THEN 'High Spender'
    WHEN max_order_value > 50 THEN 'Medium Spender'
    ELSE 'Low Spender'
  END AS spending_tier
FROM customer_data
    );
  