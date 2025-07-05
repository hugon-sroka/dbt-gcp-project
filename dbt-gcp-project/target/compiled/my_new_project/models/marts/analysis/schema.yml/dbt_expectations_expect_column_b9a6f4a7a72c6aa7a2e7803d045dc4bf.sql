

with all_values as (

    select
        Category as value_field

    from `my-dbt-project-4321790`.`shopping_trends_updated`.`age_category_analysis`
    

),
set_values as (

    select
        cast('Clothing' as string) as value_field
    union all
    select
        cast('Accessories' as string) as value_field
    union all
    select
        cast('Footwear' as string) as value_field
    union all
    select
        cast('Outerwear' as string) as value_field
    
    
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

