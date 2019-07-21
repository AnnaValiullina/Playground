DROP TABLE anya

create table anya (
	a int identity NOT NULL primary key,
	b int UNIQUE NOT NULL
);

declare @result nvarchar(400)

select @result = CONSTRAINT_NAME
from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
where CONSTRAINT_TYPE = 'PRIMARY KEY' AND TABLE_NAME = 'anya'
EXEC('ALTER TABLE BD.dbo.anya DROP CONSTRAINT ' + @result)
ALTER TABLE anya ADD CONSTRAINT pk_b PRIMARY KEY(b);
