-- A unique_key determines whether a record has new values and should be updated
{{ config(MATERIALIZED='incremental', unique_key='t_time') }}

SELECT *
    FROM SNOWFLAKE_SAMPLE_DATA.TPCDS_SF10TCL.TIME_DIM
    WHERE TO_TIME(CONCAT(T_HOUR::VARCHAR, ':', T_MINUTE, ':', T_SECOND)) <= CURRENT_TIME

    {% IF is_incremental() %}
    -- this filter will only be applied on an incremental run
    AND t_time > (SELECT max(t_time) FROM {{ this }})
    {% endif %}