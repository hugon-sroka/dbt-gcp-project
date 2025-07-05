


with age_groups AS (
    SELECT
        CASE
            
            WHEN Age < 20 then 'Under 20'
            
            WHEN Age < 35 then 'Under 35'
            
            WHEN Age < 50 then 'Under 50'
            
            ELSE 'Over 50'
        END as age_group,
        *
        FROM `my-dbt-project-4321790`.`shopping_sales`.`shopping_trends_updated`
)

SELECT
    age_group,
    Category,
    COUNT(*) as purchase_count,
    ROUND(COUNT(*) * 100 / SUM(count(*)) OVER (PARTITION BY age_group ORDER BY age_group), 1) AS percentage_in_age_group
FROM age_groups
GROUP BY age_group, Category
ORDER BY age_group, purchase_count DESC