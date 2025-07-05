
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  

with all_values as (

    select
        Payment_Method as value_field

    from `my-dbt-project-4321790`.`shopping_trends_updated`.`payment_method_analysis`
    

),
set_values as (

    select
        cast('Credit Card' as string) as value_field
    union all
    select
        cast('PayPal' as string) as value_field
    union all
    select
        cast('Cash' as string) as value_field
    union all
    select
        cast('Debit Card' as string) as value_field
    union all
    select
        cast('Venmo' as string) as value_field
    union all
    select
        cast('Bank Transfer' as string) as value_field
    
    
),
validation_errors as (
    -- values from the model that are not in the set
    select
        v.value_field
    from
        all_values v
        left join
        set_values s on v.value_field = s.value_field
    where
        s.value_field is null

)

select *
from validation_errors


  
  
      
    ) dbt_internal_test