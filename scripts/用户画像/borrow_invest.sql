
select top 10 * from xueshandai.dbo.borrow_invest

select status,count(1) as c from xueshandai.dbo.borrow_invest group by status


--投标信息
drop table portrait.dbo.t_borrow_invest_total
select investor_id
,count(1) as invest_count
,count(distinct invest_way) as invest_ways
,sum(capital) as capital
,sum(interest) as interest
,sum(loan_fee) as loan_fee
,min(activate_time) as first_invest_time
,max(activate_time) as last_invest_time
into portrait.dbo.t_borrow_invest_total
from xueshandai.dbo.borrow_invest
where status in (1,3) --status : 0-UN_EFFECTIVE("未生效"), 1-EFFECTIVE("生效"), 2-RUN_OFF("流标"), 3-REPAID("已还款")
group by investor_id

select * from portrait.dbo.t_borrow_invest_total where investor_id in (980723)

--分状态的投标
select investor_id,status
,count(1) as invest_count
,sum(capital) as capital
,sum(interest) as interest
,sum(loan_fee) as loan_fee
,max(activate_time) as last_invest_time
into portrait.dbo.t_borrow_invest_status
from xueshandai.dbo.borrow_invest
where status in (1,2,3) --status : 0-UN_EFFECTIVE("未生效"), 1-EFFECTIVE("生效"), 2-RUN_OFF("流标"), 3-REPAID("已还款")
group by investor_id,status

--常用投标渠道

drop table portrait.dbo.t_borrow_invest_way
select a.investor_id,invest_way,invest_count
,ROW_NUMBER() over(partition by a.investor_id order by invest_count desc ) as rown
,b.last_invest_time
into portrait.dbo.t_borrow_invest_way
from (
select investor_id,invest_way,count(1) as invest_count
from xueshandai.dbo.borrow_invest
where status in (1,2,3)
group by investor_id,invest_way
) a
left outer join (select investor_id,last_invest_time from portrait.dbo.t_borrow_invest_total
) b on a.investor_id=b.investor_id




select top 100 * from portrait.dbo.t_borrow_invest_way where investor_id in (10329)

drop table portrait.dbo.t_invest
select * 
into portrait.dbo.t_invest 
from (
select investor_id as id,'invest_count' as name,'投标次数' as cnname,cast(invest_count as varchar) as value,last_invest_time as dt_src
FROM portrait.dbo.t_borrow_invest_total
union all 
select investor_id as id,'invest_ways' as name,'投标渠道类别数' as cnname,cast(invest_ways as varchar) as value,last_invest_time as dt_src
FROM portrait.dbo.t_borrow_invest_total
union all
select investor_id as id,'invest_capital' as name,'投标总额' as cnname,cast(capital as varchar) as value,last_invest_time as dt_src
FROM portrait.dbo.t_borrow_invest_total
union all 
select investor_id as id,'invest_interest' as name,'投标利息' as cnname,cast(interest as varchar) as value,last_invest_time as dt_src
FROM portrait.dbo.t_borrow_invest_total
union all 
select investor_id as id,'loan_fee' as name,'投标服务费' as cnname,cast(loan_fee as varchar) as value,last_invest_time as dt_src
FROM portrait.dbo.t_borrow_invest_total
union all
select investor_id as id,'first_invest_time' as name,'首次投标时间' as cnname,CONVERT(varchar(20),first_invest_time,120)  as value,last_invest_time as dt_src
FROM portrait.dbo.t_borrow_invest_total
union all
select investor_id as id,'last_invest_time' as name,'最后一次投标时间' as cnname,CONVERT(varchar(20),last_invest_time,120)  as value,last_invest_time as dt_src
FROM portrait.dbo.t_borrow_invest_total

union all
select investor_id as id,'curr_invest_count' as name,'当前投标数' as cnname,cast(invest_count as varchar) as value,last_invest_time as dt_src
FROM portrait.dbo.t_borrow_invest_status
where status = 1
union all
select investor_id as id,'curr_invest_capital' as name,'当前投标总额' as cnname,cast(capital as varchar) as value,last_invest_time as dt_src
FROM portrait.dbo.t_borrow_invest_status
where status = 1

union all
select investor_id as id,'runoff_invest_count' as name,'流标数' as cnname,cast(invest_count as varchar) as value,last_invest_time as dt_src
FROM portrait.dbo.t_borrow_invest_status
where status = 2
union all
select a.investor_id as id,'most_invest_way' as name,'常用投标渠道' as cnname, invest_way as value,last_invest_time as dt_src
FROM portrait.dbo.t_borrow_invest_way a 
where rown=1
) a 


