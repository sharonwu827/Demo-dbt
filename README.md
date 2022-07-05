#dbt

## Setup with databases
https://docs.getdbt.com/docs/available-adapters

## Materializations
Currently, dbt supports four types of materializations: table, view, incremental, and ephemeral. The table and incremental materializations persist a table, the view materialization creates a view, and the ephemeral materialization, instead of persisting anything, returns results directly using a common table expression (CTE)

## Incremental models

Incremental models are built as tables in data warehouse. The first time a model is run, the table is built by transforming all rows of source data. On subsequent runs, dbt transforms only the rows in your source data that you tell dbt to filter for, inserting them into the target table which is the table that has already been built.

Often, the rows you filter for on an incremental run will be the rows in your source data that have been created or updated since the last time dbt ran. As such, on each dbt run, your model gets built incrementally.

Using an incremental model limits the amount of data that needs to be transformed, vastly reducing the runtime of your transformations. This improves warehouse performance and reduces compute costs.

### Filtering rows on an incremental run

## [Incremental models](https://docs.getdbt.com/docs/building-a-dbt-project/building-models/configuring-incremental-models)




## Ephemeral models