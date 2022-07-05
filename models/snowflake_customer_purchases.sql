WITH sample_customer AS (
    SELECT *
        FROM {{ source('sample', 'customer') }}
),

sample_orders AS (
SELECT *
    FROM {{ source('sample', 'orders') }} )

SELECT
    c.c_custkey
    , c.c_name
    , c.c_nationkey AS nation
    , SUM(o.o_totalprice) AS total_order_price
    FROM sample_customer c
    LEFT JOIN sample_orders o
                  ON c.c_custkey = o.o_custkey {{group_by(3)}}

