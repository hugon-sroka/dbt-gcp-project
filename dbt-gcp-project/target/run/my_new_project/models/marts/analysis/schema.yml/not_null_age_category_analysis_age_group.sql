
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select age_group
from `my-dbt-project-4321790`.`shopping_trends_updated`.`age_category_analysis`
where age_group is null



  
  
      
    ) dbt_internal_test