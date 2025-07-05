with relation_columns as (

        
        select
            cast('PAYMENT_METHOD' as string) as relation_column,
            cast('STRING' as string) as relation_column_type
        union all
        
        select
            cast('TRANSACTION_COUNT' as string) as relation_column,
            cast('INT64' as string) as relation_column_type
        union all
        
        select
            cast('TOTAL_REVENUE' as string) as relation_column,
            cast('NUMERIC' as string) as relation_column_type
        union all
        
        select
            cast('AVG_ORDER_VALUE' as string) as relation_column,
            cast('NUMERIC' as string) as relation_column_type
        union all
        
        select
            cast('PERCENTAGE_OF_ORDERS' as string) as relation_column,
            cast('FLOAT64' as string) as relation_column_type
        
        
    ),
    test_data as (

        select
            *
        from
            relation_columns
        where
            relation_column = 'TRANSACTION_COUNT'
            and
            relation_column_type not in ('INTEGER')

    )
    select *
    from test_data