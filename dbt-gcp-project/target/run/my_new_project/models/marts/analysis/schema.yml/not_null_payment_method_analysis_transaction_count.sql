
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select transaction_count
from `my-dbt-project-4321790`.`shopping_trends_updated`.`payment_method_analysis`
where transaction_count is null



  
  
      
    ) dbt_internal_test