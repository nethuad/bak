select * from grade

CREATE TABLE grade (
	Student_id int, 
 	Mark varchar(2)
);

comment on column grade.Mark is 'grade mark';

comment on table grade is 'grade table';


https://www.postgresql.org/docs/10/static/sql-comment.html

--²éÑ¯±í×¢ÊÍ
select description from pg_description join pg_class on pg_description.objoid = pg_class.oid where relname = 'grade'


--https://stackoverflow.com/questions/109325/postgresql-describe-table


1. 

declare a integer;

drop a
select count(1) into a from grade;

select count(1)+1 into b from grade;
select a+b;

raise notice '%',a;