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
where activity_type=8
group by CONVERT(varchar(7) , date_created, 120 )
order by ym
--2017-11	1080.00
--2017-12	52410.00
--2018-01	30855.00
--2018-02	57150.00


select *
select  id,member_id,amount, activity_type,remark,borrow_id,invest_id,investor_id,date_created
from Third_Prize_Detail
where activity_type = 8
--and date_created>='2018-01-01'
and member_id=86246
and invest_id=316000

360

select * from borrow_invest where id=316000

select * from Member_Recommend_Award where invest_id=316000

select CONVERT(varchar(7) , date_created, 120 ) as ym,
sum(award) as amount 
from Member_Recommend_Award 
group by CONVERT(varchar(7) , date_created, 120 )
order by ym

--计算获得的奖励，推荐人总数,推荐人的投标情况

