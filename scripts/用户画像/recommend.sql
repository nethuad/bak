
--计算推荐人层次
drop table #rec
select a.referrer_id as recommender_id
,b.referrer_id as rcid_rcid
,case when b.member_id is null then a.referrer_id else null end as top_rcid 
,case when b.member_id is null then 0 else null end as recommender_level --没有推荐人的推荐人的level=0
into #rec
from(
select distinct referrer_id from xueshandai.dbo.recommend
) a 
left outer join xueshandai.dbo.recommend b on a.referrer_id = b.member_id


select recommender_level,count(1) as c  
from #rec
group by recommender_level

--备份
drop table #2
SELECT * INTO #2 from  #rec




--循环计算推荐人的层次
declare @x int
select @x=count(1) from #2 where recommender_level is null
print @x
while @x>0
begin
	-- 循环准备
	drop table  #1
	select * into #1 from #2

	--递归计算
	drop table #2 

	select a.recommender_id,a.rcid_rcid
	,case when b.recommender_level is null then null else b.top_rcid end as top_rcid
	,case when b.recommender_level is null then null else b.recommender_level+1 end as recommender_level
	into #2
	from (
	select * from #1 where recommender_level is null
	) a  
	left outer join (
	select * from #1 where recommender_level is not null
	) b on  a.rcid_rcid = b.recommender_id

	union all 

	select * from #1 where recommender_level is not null

	select @x=count(1) from #2 where recommender_level is null

	print @x
end


--推荐人层级
drop table portrait.dbo.t_recommender_level
select a.*
into portrait.dbo.t_recommender_level 
from #2 a 


select * from #2
select * from xueshandai.dbo.recommend

select * from portrait.dbo.t_recommender_level where recommender_id=41400

select recommender_level,count(1) as c 
from portrait.dbo.t_recommender_level 
group by recommender_level 
order by recommender_level
 


-- 被推荐人的推荐等级
drop table portrait.dbo.t_member_recommended_level
select member_id,referrer_id as recommender_id,b.recommender_level+1 as recommended_level
into portrait.dbo.t_member_recommended_level
from xueshandai.dbo.recommend a
left outer join portrait.dbo.t_recommender_level b on a.referrer_id=b.recommender_id

select * from portrait.dbo.t_member_recommended_level where member_id=980723

-- 推荐人数
drop table portrait.dbo.t_recommender_recommended_members
select recommender_id,count(1) as recommended_members
into portrait.dbo.t_recommender_recommended_members
from portrait.dbo.t_member_recommended_level
group by recommender_id

select * from portrait.dbo.t_recommender_recommended_members where recommender_id=41400

--推荐人的推荐收益
drop table portrait.dbo.t_recommender_recommend_prize
select recommender_id
,sum(prize) as prize
,max(last_updated) as last_updated
into portrait.dbo.t_recommender_recommend_prize
from xueshandai.dbo.recommend_invest a
inner join portrait.dbo.t_member_recommended_level b on a.member_id = b.member_id
where RECOMMEND_TYPE=0
group by recommender_id

select * from portrait.dbo.t_recommender_recommend_prize where recommender_id in (41400)

--按照推荐人汇总投标信息
drop table portrait.dbo.t_recommender_recommended_invest
select recommender_id
,count(distinct investor_id) as investors
,sum(capital) as capital
,sum(interest) as interest
,sum(loan_fee) as loan_fee
into portrait.dbo.t_recommender_recommended_invest
from xueshandai.dbo.borrow_invest a 
inner join portrait.dbo.t_member_recommended_level b on a.investor_id = b.member_id
where a.status in (1,3)
group by recommender_id

select top 10 * from portrait.dbo.t_recommender_recommended_invest where recommender_id in (41400)


-- 汇总

drop table portrait.dbo.t_recommend
select * 
into portrait.dbo.t_recommend 
from (
select recommender_id as id,'is_recommender' as name,'是否为推荐人' as cnname,'1' as value,null as dt_src
FROM portrait.dbo.t_recommender_level

union all

select recommender_id as id,'recommender_level' as name,'推荐人等级' as cnname,cast(recommender_level as varchar) as value,null as dt_src
FROM portrait.dbo.t_recommender_level

union all

select member_id as id,'is_recommended' as name,'是否被推荐' as cnname,'1' as value,null as dt_src
FROM portrait.dbo.t_member_recommended_level

union all

select member_id as id,'recommender_id' as name,'推荐人id' as cnname,cast(recommender_id as varchar) as value,null as dt_src
FROM portrait.dbo.t_member_recommended_level

union all

select member_id as id,'recommended_level' as name,'被推荐等级' as cnname,cast(recommended_level as varchar) as value,null as dt_src
FROM portrait.dbo.t_member_recommended_level

union all

select recommender_id as id,'recommender_recommended_members' as name,'推荐人数' as cnname,cast(recommended_members as varchar) as value,null as dt_src
FROM portrait.dbo.t_recommender_recommended_members

union all

select recommender_id as id,'recommender_recommend_prize' as name,'推荐奖励' as cnname,cast(prize as varchar) as value,last_updated as dt_src
FROM portrait.dbo.t_recommender_recommend_prize

union all

select recommender_id as id,'recommender_recommend_investors' as name,'推荐有效人数' as cnname,cast(investors as varchar) as value,null as dt_src
FROM portrait.dbo.t_recommender_recommended_invest

union all

select recommender_id as id,'recommender_recommend_capital' as name,'推荐用户投标金额' as cnname,cast(capital as varchar) as value,null as dt_src
FROM portrait.dbo.t_recommender_recommended_invest

union all

select recommender_id as id,'recommender_recommend_interest' as name,'推荐用户投标利息' as cnname,cast(interest as varchar) as value,null as dt_src
FROM portrait.dbo.t_recommender_recommended_invest

union all

select recommender_id as id,'recommender_recommend_loanfee' as name,'推荐用户投标服务费' as cnname,cast(loan_fee as varchar) as value,null as dt_src
FROM portrait.dbo.t_recommender_recommended_invest
) a 


select * from portrait.dbo.t_recommend where id in (980723,41400)

select sum(cast(VALUE as real) ) as c 
from portrait.dbo.t_recommend 
where name='recommender_recommend_capital'

 
select  top 10 *
from portrait.dbo.t_recommender_level

select recommender_level,count(1) as c 
from portrait.dbo.t_recommender_level
group by recommender_level
order by recommender_level






