
-- 投标收益服务费推荐奖励
select a.*
,case when b.invest_id is null THEN 0 else 1 end as is_recommend
,b.recommend_rate
,b.prize as recommend_prize
,b.borrow_id as borrow_id_b
,b.member_id as member_id_b
,b.recommend_id as recommend_id_b
,r.member_id as member_id_r
,r.referrer_id as referrer_id_r
into portrait.dbo.borrow_invest_recommend
from borrow_invest a 
left outer join ( select * from recommend_invest where RECOMMEND_TYPE=0) b on a.id=b.invest_id   --RECOMMEND_TYPE：   REFERRER("推荐人"),  REG("被推荐人")，只取推荐人的收益
left outer join recommend r on b.recommend_id = r.id

select top 10 * from portrait.dbo.borrow_invest_recommend where investor_id=980723




select a.activate_ym,a.capital as capital_nr,a.interest as interest_nr, a.loan_fee as loan_fee_nr
, b.capital as capital_r,b.interest as interest_r, b.loan_fee as loan_fee_r,b.recommend_prize
,(a.capital+b.capital) as capital_total, (a.interest+b.interest) as interest_total,(a.loan_fee+b.loan_fee) as loan_fee_total
into portrait.dbo.rp_borrow_invest_recommend
from (
select
CONVERT(varchar(7) , activate_time, 120 ) as activate_ym
,is_recommend
,sum(capital) as capital
,sum(interest) as interest
,sum(loan_fee) as loan_fee
,sum(recommend_prize) as recommend_prize
from portrait.dbo.borrow_invest_recommend
where status in (1,3) and is_recommend = 0
and activate_time is not null
group by CONVERT(varchar(7) , activate_time, 120 ),is_recommend
) a 
left outer join (
select
CONVERT(varchar(7) , activate_time, 120 ) as activate_ym
,is_recommend
,sum(capital) as capital
,sum(interest) as interest
,sum(loan_fee) as loan_fee
,sum(recommend_prize) as recommend_prize
from #1
where status in (1,3) and is_recommend = 1
and activate_time is not null
group by CONVERT(varchar(7) , activate_time, 120 ),is_recommend
) b on a.activate_ym = b.activate_ym

--报表一
select activate_ym as 年月
, capital_nr as 投标_非推荐
, loan_fee_nr as 服务费_非推荐
, capital_r as 投标_推荐
, loan_fee_r as 服务费_推荐
, recommend_prize as 推荐奖励
, capital_total as 投标_总计, loan_fee_total as 服务费_总计
,capital_r*1.0/capital_total as 投标推荐占比,loan_fee_r*1.0/loan_fee_total as 服务费推荐占比
,recommend_prize*1.0/loan_fee_r as 推荐奖励_div_推荐服务费,recommend_prize*1.0/loan_fee_total as 推荐奖励_div_总服务费
from portrait.dbo.rp_borrow_invest_recommend
order by activate_ym


-- 用户推荐分类
--select a.id as member_id
--,case when b.member_id is null and c.recommender_id is null then '普通'
--when b.member_id is null and c.recommender_id is not null  then '推荐用户'
--when b.member_id is not null and c.recommender_id is null then '被推荐用户'
--when b.member_id is not null and c.recommender_id is not null and c.recommender_level=1 then '被首次推荐且推荐用户'
--when b.member_id is not null and c.recommender_id is not null and c.recommender_level>1 then '被2次及以上推荐且推荐用户'
--end as member_recommend_type
--into portrait.dbo.member_recommend_type
--from member a
--left outer join portrait.dbo.member_recommended_level b on a.id=b.member_id
--left outer join portrait.dbo.recommender_level c on a.id = c.recommender_id

drop table portrait.dbo.member_recommend_type
select a.id as member_id
,case when b.member_id is null and c.recommender_id is null then '普通'
when b.member_id is null and c.recommender_id is not null  then '顶层推荐用户'
when b.member_id is not null and b.recommended_level=1 then '被推荐用户-1'
when b.member_id is not null and b.recommended_level=2 then '被推荐用户-2'
when b.member_id is not null and b.recommended_level>=3 then '被推荐用户3层及以上'
end as member_recommend_type
into portrait.dbo.member_recommend_type
from member a
left outer join portrait.dbo.member_recommended_level b on a.id=b.member_id
left outer join portrait.dbo.recommender_level c on a.id = c.recommender_id

select member_recommend_type,count(1) as c from portrait.dbo.member_recommend_type group by member_recommend_type 
普通	286024
顶层推荐用户	7084
被推荐用户-1	167664
被推荐用户-2	133456
被推荐用户3层及以上	334470


select recommended_level,count(1) as c from portrait.dbo.member_recommended_level group by recommended_level 
1	167664
2	133456
3	117608
4	94439

select * from portrait.dbo.recommender_level where 

select * from portrait.dbo.member_recommended_level where member_id in (980723,41400)
select * from portrait.dbo.member_recommend_type where member_id in (980723,41400)

--分类用户投标
select 
CONVERT(varchar(7) , activate_time, 120 ) as activate_ym
,b.member_recommend_type
,count(distinct investor_id) as members
,sum(capital) as capital
from borrow_invest a 
inner join  portrait.dbo.member_recommend_type b on a.investor_id = b.member_id
where a.status in (1,3) and activate_time is not null
group by CONVERT(varchar(7) , activate_time, 120 ),b.member_recommend_type









