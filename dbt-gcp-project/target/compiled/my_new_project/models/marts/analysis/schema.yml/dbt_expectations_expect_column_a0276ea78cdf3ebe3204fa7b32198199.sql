






    with grouped_expression as (
    select
        
        
    
  
( 1=1 and age_group > 18 and age_group < 100
)
 as expression


    from `my-dbt-project-4321790`.`shopping_trends_updated`.`age_category_analysis`
    

),
validation_errors as (

    select
        *
    from
        grouped_expression
    where
        not(expression = true)

)

select *
from validation_errors







