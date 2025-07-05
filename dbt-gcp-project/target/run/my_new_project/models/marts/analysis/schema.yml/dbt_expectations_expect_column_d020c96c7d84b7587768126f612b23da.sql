
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  






    with grouped_expression as (
    select
        
        
    
  
( 1=1 and total_revenue >= 0.01 and total_revenue <= 1000000
)
 as expression


    from `my-dbt-project-4321790`.`shopping_trends_updated`.`payment_method_analysis`
    where
        total_revenue IS NOT NULL
    
    

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