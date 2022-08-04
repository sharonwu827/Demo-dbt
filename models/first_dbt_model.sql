{{ config(materialized='table'
, alias='first_model'
, schema = 'Sharon_test'
, database = 'eng_test'
, tags=["nightly", "example"] )
}}

with source_data as (

    select 1 as id, 'NJ' as state, '2020-02-01 00:01:00.000'::timestamp as updated_at
    union all
    select null as id, 'CT' as state, '2020-01-01 00:00:00.000'::timestamp as updated_at
    union all
    select 4 as id, 'VT' as state, '2020-01-01 00:00:00.000'::timestamp as updated_at

)

select *, {{ var("my_first_variable")}} as first_variable
from source_data
where id>= {{ var("my_third_variable")}}