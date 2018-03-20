select CONVERT(varchar(10),reg_time,120) as d
,case when reg_way is null then '' when reg_way like 'Android%' then 'Android%' else reg_way end as reg_way
,count(1) as C
from xueshandai.dbo.member
group by CONVERT(varchar(10),reg_time,120),case when reg_way is null then '' when reg_way like 'Android%' then 'Android%' else reg_way end
order by d,reg_way



case when reg_way is null then '' when reg_ way like 'Android%' then 'Android%' else reg_way end


select * from portrait.dbo.member_base where id=980723

select value,count(1) as c from portrait.dbo.member_base where name='reg_way' group by value

