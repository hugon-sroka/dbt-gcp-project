






    with grouped_expression as (
    select
        
        
    
  
( 1=1 and avg_order_value >= 0.01 and avg_order_value <= 10000
)
 as expression


    from `my-dbt-project-4321790`.`shopping_trends_updated`.`payment_method_analysis`
    

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







