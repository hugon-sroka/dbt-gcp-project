
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select avg_order_value
from `my-dbt-project-4321790`.`shopping_trends_updated`.`payment_method_analysis`
where avg_order_value is null



  
  
      
    ) dbt_internal_test