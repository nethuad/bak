use xueshandai

-- 存管表 Third_Prize_Detail

activity_type:
1,其他
2,推荐投资奖励
3,续投奖励
4,投资红包
5,投资加息券
6,投资抵现券
7,雪山贷十人计划
8,雪山六友
9,信用卡还款奖励
10,信用卡还款推荐人奖励
11,话费充值推荐人奖励
12,平台后台转账
13,存管没有迁移
14,新手体验标奖励
15,话费充值退款
16,短期活动
17,余额连盈

select CONVERT(varchar(7) , date_created, 120 ) as ym,
sum(amount) as amount 
from Third_Prize_Detail 
where activity_type=7
group by CONVERT(varchar(7) , date_created, 120 )
order by ym
--2017-12	9176.00
--2018-01	8814.00
--2018-02	7732.00


select *
select  id,member_id,amount, activity_type,remark,borrow_id,invest_id,investor_id,date_created
from Third_Prize_Detail
where activity_type = 7
and member_id=280488

DoubbleSectionAward：（AWARD_TYPE）：21
LotteryChance（AWARD_TYPE）23，LotteryAward
TransferDetail


select * from Doubble_Section_Award where award_type=21 
and open_id = 280488
--id	open_id	share_num	login_key	prize	award_type	date_create	version	recommend_member_id
--1060221	280488	10		满足雪山十人计划(10人A档奖励)	21	2017-12-24 16:33:06	0	0



select * from Lottery_Award a 
where investor_id = 280488 and lottery_chance_id in (select id from Lottery_Chance where award_type=23)



315130
315131
315132

select * 
from Transfer_Detail 
where capital_type =  14
and receiver_id in (280488)



select CONVERT(varchar(7) , date_created, 120 ) as ym
,count(distinct receiver_id) as members
,sum(capital) as amount 
from Transfer_Detail 
where capital_type =  14
group by CONVERT(varchar(7) , date_created, 120 )
order by ym

--2017-03	5	17952.00
--2017-04	5	10176.00
--2017-05	6	11032.00
--2017-06	10	18752.00
--2017-07	10	22090.00
--2017-08	6	8620.00
--2017-09	7	9426.00
--2017-10	4	6898.00
--2017-11	4	4400.00
--2017-12	3	9176.00
--2018-01	6	8814.00
--2018-02	6	7732.00

select receiver_id
,sum(capital) as amount 
from Transfer_Detail 
where capital_type =  14
group by receiver_id


drop table #1
select distinct receiver_id as member_id
into #1
from Transfer_Detail 
where capital_type = 14

select count(1) as c from #1
42

select 

drop table #2
select a.referrer_id,a.member_id,reg_time
into #2
from recommend a 
inner join #1 b on a.referrer_id = b.member_id
left outer join member c on a.member_id = c.id



select 
count(1) as c
,count(distinct referrer_id) as c2
,count(distinct member_id) as c3
from #2

select
referrer_id
,count(1) as c
from #2
group by referrer_id



select CONVERT(varchar(7) , reg_time, 120 ) as ym
,count(1) as c 
from #2
group by CONVERT(varchar(7) , reg_time, 120 )
order by ym



select id,activate_time,investor_id,capital,loan_fee,referrer_id
into #3
from borrow_invest a 
inner join #2 b on a.investor_id=b.member_id
where status in (1,3) and activate_time is not null


select top 10 * from #3 


select CONVERT(varchar(7) , activate_time, 120 ) as activate_ym
,count(distinct investor_id) as members
,sum(capital) as capital
,sum(loan_fee) as loan_fee
from #3
group by CONVERT(varchar(7) , activate_time, 120 )
order by activate_ym

推荐人的效率
select referrer_id
,count(distinct investor_id) as members
,sum(capital) as capital
,sum(loan_fee) as loan_fee
from #3
group by referrer_id


获取有效的member_id


select CONVERT(varchar(7) , reg_time, 120 ) as ym
,count(1) as c
from (
select distinct investor_id
from borrow_invest a 
inner join #2 b on a.investor_id=b.member_id
where status in (1,3) and activate_time is not null
) a 
inner join member b on a.investor_id=b.id
group by  CONVERT(varchar(7) , reg_time, 120 )
order by ym


select * from #2










