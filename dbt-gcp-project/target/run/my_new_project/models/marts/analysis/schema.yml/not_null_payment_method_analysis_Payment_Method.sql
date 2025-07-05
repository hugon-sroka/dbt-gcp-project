
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select Payment_Method
from `my-dbt-project-4321790`.`shopping_trends_updated`.`payment_method_analysis`
where Payment_Method is null



  
  
      
    ) dbt_internal_test