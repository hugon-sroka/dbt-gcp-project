
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select Purchase_count
from `my-dbt-project-4321790`.`shopping_trends_updated`.`age_category_analysis`
where Purchase_count is null



  
  
      
    ) dbt_internal_test