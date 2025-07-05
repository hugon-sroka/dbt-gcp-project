with relation_columns as (

        
        select
            cast('AGE_GROUP' as string) as relation_column,
            cast('STRING' as string) as relation_column_type
        union all
        
        select
            cast('CATEGORY' as string) as relation_column,
            cast('STRING' as string) as relation_column_type
        union all
        
        select
            cast('PURCHASE_COUNT' as string) as relation_column,
            cast('INT64' as string) as relation_column_type
        union all
        
        select
            cast('PERCENTAGE_IN_AGE_GROUP' as string) as relation_column,
            cast('FLOAT64' as string) as relation_column_type
        
        
    ),
    test_data as (

        select
            *
        from
            relation_columns
        where
            relation_column = 'PURCHASE_COUNT'
            and
            relation_column_type not in ('INTEGER')

    )
    select *
    from test_data