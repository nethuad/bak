use xueshandai

select CONVERT(varchar(7) , date_created, 120 ) as ym,
sum(award) as amount 
from Member_Recommend_Award 
group by CONVERT(varchar(7) , date_created, 120 )
order by ym

--计算获得的奖励，推荐人总数,推荐人的投标情况

select count(1) as c ,count(distinct member_id),count(distinct invest_id) as c2 from Member_Recommend_Award
--4212	182	4212

select top 10 * from Member_Recommend_Award

select is_reward, count(1) as c from Member_Recommend_Award group by is_reward

select cycle,count(1) as c from (
select a.member_id,a.borrow_id,a.invest_id,a.capital,a.award,award/cast(capital/10000 as int)/15 as cycle
from Member_Recommend_Award a
) a 
group by cycle


drop table #1
select a.date_created,a.member_id,a.borrow_id,a.invest_id,a.capital,a.award
,b.activate_time,b.investor_id,b.capital as capital_b,b.interest,b.loan_fee
into #1
from Member_Recommend_Award a
inner join borrow_invest b on a.invest_id=b.id

select count(1) from #1
4225

select * from #1
where member_id <> investor_id or capital <> capital_b

select top 3 * from #1


select top 10 * from borrow_invest

select CONVERT(varchar(7) , activate_time, 120 ) as ym
,count(distinct investor_id) as investors
,count(1) as invests
,sum(capital) as capital
,sum(award) as award,sum(loan_fee) as loan_fee 
from #1
group by CONVERT(varchar(7) , activate_time, 120 )



select count(distinct member_id) from #1

--分析被推荐人
drop table #2
select a.referrer_id,a.member_id,reg_time
into #2
from recommend a 
inner join (select distinct member_id from #1) b on a.referrer_id = b.member_id
left outer join member c on a.member_id = c.id

select count(1) as c,count(distinct referrer_id ) as refs,count(distinct member_id) as recs from #2
--4657 184 4657 967

select CONVERT(varchar(7) , reg_time, 120 ) as ym
,count(1) as c 
from #2
group by CONVERT(varchar(7) , reg_time, 120 )
order by ym

drop table #3
select id,activate_time,investor_id,capital,loan_fee,referrer_id
into #3
from borrow_invest a 
inner join #2 b on a.investor_id=b.member_id
where status in (1,3) and activate_time is not null


select top 10 * from #3 


select count(distinct investor_id) from #3
967

select CONVERT(varchar(7) , activate_time, 120 ) as activate_ym
,count(distinct investor_id) as members
,sum(capital) as capital
,sum(loan_fee) as loan_fee
from #3
group by CONVERT(varchar(7) , activate_time, 120 )
order by activate_ym

select top 10 * from #2


select a.member_id as 推荐人id
,a.capital as 推荐人投标金额
,award as 推荐人六友奖励
,a.loan_fee as 推荐人投标服务费
,c.members as 被推荐人数量
,b.investors as 投标的被推荐人
,b.capital as 被推荐人的投标金额
,b.loan_fee as 被推荐人的服务费
from (
select member_id
,sum(capital) as capital
,sum(award) as award
,sum(loan_fee) as loan_fee
from #1
group by member_id
) a 
left outer join (
select referrer_id
,count(distinct investor_id) as investors
,sum(capital) as capital
,sum(loan_fee) as loan_fee
from #3
group by referrer_id) b on a.member_id=b.referrer_id
left outer join (select referrer_id,count(distinct member_id) as members from #2 group by referrer_id ) c on a.member_id=c.referrer_id



