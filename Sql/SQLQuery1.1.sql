use [BD]
go

delete from RDB$RELATION_CONSTRAINTS
where rdb$relation_name = 'car_brand' and RDB$INDEX_NAME = 'PRIMARY KEY'
 
alter table car_brand ADD constraint pk_volume primary key(volume)
