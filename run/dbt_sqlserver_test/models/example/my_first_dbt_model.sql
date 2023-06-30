
  
    -- drop previous temp view
    
    
    
    
    USE [testDB];
    if object_id ('"dbt"."my_first_dbt_model__dbt_tmp_temp_view"','V') is not null
        begin
            drop view "dbt"."my_first_dbt_model__dbt_tmp_temp_view"
        end


    -- create temp view
   USE [testDB];
   EXEC('create view "dbt"."my_first_dbt_model__dbt_tmp_temp_view" as
    /*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/



with source_data as (

    select 1 as id
    union all
    select null as id

)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
    ');

   -- select into the table and create it that way
   
   SELECT *
   INTO "dbt"."my_first_dbt_model__dbt_tmp"
   FROM "testDB"."dbt"."my_first_dbt_model__dbt_tmp_temp_view"

   -- drop temp view
   
    
    
    
    
    USE [testDB];
    if object_id ('"dbt"."my_first_dbt_model__dbt_tmp_temp_view"','V') is not null
        begin
            drop view "dbt"."my_first_dbt_model__dbt_tmp_temp_view"
        end
-- add columnstore index
        use [testDB];
  if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'dbt_my_first_dbt_model__dbt_tmp_cci'
        AND object_id=object_id('dbt_my_first_dbt_model__dbt_tmp')
    )
  DROP index "dbt"."my_first_dbt_model__dbt_tmp".dbt_my_first_dbt_model__dbt_tmp_cci
  CREATE CLUSTERED COLUMNSTORE INDEX dbt_my_first_dbt_model__dbt_tmp_cci
    ON "dbt"."my_first_dbt_model__dbt_tmp"

  