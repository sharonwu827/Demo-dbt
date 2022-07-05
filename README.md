#dbt

## Setup with databases
https://docs.getdbt.com/docs/available-adapters

## Materializations
Currently, dbt supports four types of materializations: table, view, incremental, and ephemeral. The table and incremental materializations persist a table, the view materialization creates a view, and the ephemeral materialization, instead of persisting anything, returns results directly using a common table expression (CTE)

## Incremental models
incremental models allow dbt to insert or update records into a table since the last time that dbt was run.

Incremental models are built as tables in data warehouse. The first time a model is run, the table is built by transforming all rows of source data. On subsequent runs, dbt transforms only the rows in your source data that you tell dbt to filter for, inserting them into the target table which is the table that has already been built.

Often, the rows you filter for on an incremental run will be the rows in your source data that have been created or updated since the last time dbt ran. As such, on each dbt run, your model gets built incrementally.

Using an incremental model limits the amount of data that needs to be transformed, vastly reducing the runtime of your transformations. This improves warehouse performance and reduces compute costs.

- Pros: significantly reduce the build time by just transforming new records 
  
- Cons: Incremental models require extra configuration and are an advanced usage of dbt. 

- Advice:
  - Incremental models are best for event-style data. Use incremental models when your dbt runs are becoming too slow (i.e. don't start with incremental models)
  

## [Incremental models](https://docs.getdbt.com/docs/building-a-dbt-project/building-models/configuring-incremental-models)


## Ephemeral models

ephemeral models are not directly built into the database. Instead, dbt will interpolate the code from this model into dependent models as a common table expression.

Pros:
- You can still write reusable logic
- Ephemeral models can help keep your data warehouse clean by reducing clutter (also consider splitting your models across multiple schemas by using custom schemas).

Cons:
- You cannot select directly from this model.
- Operations (e.g. macros called via dbt run-operation cannot ref() ephemeral nodes)
- Overuse of the ephemeral materialization can also make queries harder to debug.

Use the ephemeral materialization for:
- very light-weight transformations that are early on in your DAG
- are only used in one or two downstream models, and do not need to be queried directly


## Resources
- [documents](https://docs.getdbt.com/docs/introduction)