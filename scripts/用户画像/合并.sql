use portrait

--delete from member_base
--INSERT INTO portrait.dbo.member_base(id,name,cnname,value,src,dt_src)

drop table portrait.dbo.member_base

select * 
into portrait.dbo.member_base 
from (

select id,'member' as pt_type, name,cnname,value,'member' as src,dt_src
from portrait.dbo.t_member

union all 

select id,'invest' as pt_type,name,cnname,value,'borrow_invest' as src,dt_src
from portrait.dbo.t_invest

union all

select id,'recommend' as pt_type,name,cnname,value,'recommend' as src,dt_src
from portrait.dbo.t_recommend
) a 


--校验

select count(1) as c ,count(distinct id,name) as c2 from portrait.dbo.member_base


--查看
select count(1) as c  from member_base
select * from member_base where id in (980723)
select * from member_base where id in (10329)
select * from member_base where id in (32618) order by src --vip