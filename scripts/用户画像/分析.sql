
--切片 首次投标日期
SELECT id,convert(varchar(10),value,120) as first_invest_day 
FROM portrait.dbo.member_base 
where name='first_invest_time'

and id=980723

group by convert(varchar(10),value,120)
order by convert(varchar(10),value,120)

and id = 980723


select 
