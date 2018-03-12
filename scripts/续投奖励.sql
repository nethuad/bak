use xueshandai

select * from proceed_invest_freeze

续投奖励表 ： Proceed_Invest_Prize， 
status : 0-NONE("初始"), 1-SUCCESS("成功"), 2-FAIL("取消发放")
event_source: 对应borrow_invest的id

drop table #1
select
event_source as invest_id
,a.date_created,handle_time
,convert_capital,convert_rate,cash_capital
,in_comer_id,proceed_invest_pool_id
,a.status as status_process,allow_grant
,b.activate_time
,b.investor_id
,b.capital
,b.interest
,b.loan_fee
,b.status
into #1
from proceed_invest_prize a 
left outer join borrow_invest b on a.event_source = b.id
where a.status=1 

select * from borrow_invest

--check
select status,count(1) as c from #1 group by status
select * from #1 where in_comer_id<>investor_id
select * from #1 where convert_capital>capital
select * from #1 where status is null



select CONVERT(varchar(7) , activate_time, 120 ) as ym
,count(distinct investor_id) as members
,sum(capital) as capital
,sum(convert_capital) as convert_capital
,sum(interest) as interest
,sum(loan_fee) as loan_fee
,sum(cash_capital) as proceed_prize
into portrait.dbo.rp_proceed_prize
from #1
where status=1
group by CONVERT(varchar(7) , activate_time, 120 )
order by ym

select ym as 年月
,members as 续投用户数
,capital as 投标金额
,convert_capital as 续投金额
,loan_fee as 服务费
,proceed_prize as 续投奖励
,proceed_prize/convert_capital as 续投奖励率
,convert_capital/capital as 续投金额_div_投标金额
,proceed_prize/loan_fee as 续投奖励_div_服务费
from portrait.dbo.rp_proceed_prize
order by ym











