








--³äÖµ





select * from member where id=103010

select distinct is_vip from member





select CONVERT(varchar(10),reg_time,120) as d,reg_way,count(1) as C
from xueshandai.dbo.member
where reg_time>='2017-02-01'
group by CONVERT(varchar(10),reg_time,120),reg_way
order by d,reg_way

select reg_way,count(1) as C
from xueshandai.dbo.member
where reg_time>='2017-02-01'
group by reg_way
order by reg_way