--выбрать имена всех таблиц, созданных назначенным пользователем базы данных (например, пользователем s33 для базы d33)
select *
from sys.extended_properties


select sys.objects.name
from
	sys.objects
	join sys.schemas on schemas.schema_id = objects.schema_id
where
	objects.type = 'U' and
	objects.object_id not in (select major_id from sys.extended_properties) and
	USER_ID() = ISNULL(objects.principal_id, schemas.principal_id)

--выбрать имя таблицы, имя столбца таблицы, признак того, допускает ли данный столбец null-значения, 
--название типа данных столбца таблицы, размер этого типа данных - для всех таблиц, 
--созданных назначенным пользователем базы данных и всех их столбцов

select sys.objects.name, sys.columns.name, sys.columns.is_nullable, sys.types.name, sys.columns.max_length
from sys.columns
	join sys.objects on sys.columns.object_id = sys.objects.object_id
	join sys.types on sys.types.user_type_id = sys.columns.user_type_id
	join sys.schemas on sys.schemas.schema_id = sys.objects.schema_id
where 
	objects.type = 'U' and
	USER_ID() = ISNULL(objects.principal_id, schemas.principal_id)


--выбрать название ограничения целостности (первичные и внешние ключи), имя таблицы, 
--в которой оно находится, признак того, что это за ограничение ('PK' для первичного ключа и 'F' для внешнего) - 
--для всех ограничений целостности, созданных назначенным пользователем базы данных

select s1.name as constraint_name, s2.name as table_name, s1.type as constaint_type
from
	sys.objects s1
	join sys.objects s2 on s1.parent_object_id = s2.object_id
	join sys.schemas on schemas.schema_id = s1.schema_id
where
	(s1.type = 'PK' or s1.type = 'F') and
	s2.object_id not in (select major_id from sys.extended_properties) and
	USER_ID() = ISNULL(s1.principal_id, schemas.principal_id)


--выбрать название внешнего ключа, имя таблицы, содержащей внешний ключ, имя таблицы, 
--содержащей его родительский ключ - для всех внешних ключей, созданных назначенным пользователем базы данных

select sys.foreign_keys.name as constraint_name, reference.name as referenced_object, parent.name as parent_odject
from sys.foreign_keys
	join sys.objects reference on reference.object_id = sys.foreign_keys.referenced_object_id
	join sys.objects parent on parent.object_id = sys.foreign_keys.parent_object_id
	join sys.schemas on sys.schemas.schema_id = sys.foreign_keys.schema_id
where
--	sys.foreign_keys.type = 'F' and 
	USER_ID() = ISNULL(sys.foreign_keys.principal_id, schemas.principal_id)


--выбрать название представления, SQL-запрос, создающий это представление - для всех представлений, 
--созданных назначенным пользователем базы данных

select sys.objects.name as view_name, sys.sql_modules.definition as sql_select
from sys.objects
	join sys.schemas on sys.schemas.schema_id = sys.objects.schema_id
	join sys.sql_modules on sys.sql_modules.object_id = sys.objects.object_id
where
	sys.objects.type = 'V' and 
	USER_ID() = ISNULL(sys.objects.principal_id, schemas.principal_id)

--выбрать название триггера, имя таблицы, для которой определен триггер - для всех триггеров, 
--созданных назначенным пользователем базы данных

select sys.objects.name as trigger_name, parent.name as parent_name
from sys.objects
	join sys.schemas on sys.schemas.schema_id = sys.objects.schema_id
	join sys.objects parent on sys.objects.parent_object_id = parent.object_id
where
	sys.objects.type = 'TR' and 
	USER_ID() = ISNULL(sys.objects.principal_id, schemas.principal_id)


/*

create user test
if object_id('test', 'U') is not null 
	drop user test

grant create table to test

create schema user_schema
create table temp (x int)

drop schema user_schema
drop table temp

grant alter on schema::user_schema to test
alter authorization on schema::user_schema to test

execute as user='test'
revert

*/