
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  






    with grouped_expression as (
    select
        
        
    
  
( 1=1 and percentage_of_orders >= 0 and percentage_of_orders <= 100
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








  
  
      
    ) dbt_internal_test