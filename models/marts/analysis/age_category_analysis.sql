{{
    config(
        materialized = "table"
    )
}}


with age_groups AS (
    SELECT
        CASE
            {% for limit in [20,35,50] %}
            WHEN Age < {{limit}} then 'Under {{limit}}'
            {% endfor %}
            ELSE 'Over 50'
        END as age_group,
        *
        FROM {{source('gcp_shopping_data', 'shopping_trends_updated')}}
)

SELECT
    age_group,
    Category,
    COUNT(*) as purchase_count,
    ROUND(COUNT(*) * 100 / SUM(count(*)) OVER (PARTITION BY age_group ORDER BY age_group), 1) AS percentage_in_age_group
FROM age_groups
GROUP BY age_group, Category
ORDER BY age_group, purchase_count DESC

