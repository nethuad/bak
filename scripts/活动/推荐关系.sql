--��ȡ�����Ƽ��˲��
drop table #rec
select a.referrer_id as recommender_id
,b.referrer_id as rcid_rcid
,case when b.member_id is null then a.referrer_id else null end as top_rcid 
,case when b.member_id is null then 0 else null end as recommender_level --û���Ƽ��˵��Ƽ��˵�level=0
into #rec
from(
select distinct referrer_id from xueshandai.dbo.recommend
) a 
left outer join xueshandai.dbo.recommend b on a.referrer_id = b.member_id


select recommender_level,count(1) as c  from #rec group by recommender_level
--0	7084
--	22339
	
--����
drop table #2
SELECT * INTO #2 from  #rec

DROP TABLE #1
SELECT * INTO #1 FROM #2


--ѭ�������Ƽ��˵Ĳ��
declare @x int
select @x=count(1) from #2 where recommender_level is null
print @x
while @x>0
begin
	-- ѭ��׼��
	IF OBJECT_ID('tempdb..#1') IS NOT NULL drop table  #1
	select * into #1 from #2

	--�ݹ����
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


select top 10 * from #2

--�Ƽ�����Ϣ
drop table portrait.dbo.pt_recommend_recommender
select recommender_id,rcid_rcid,top_rcid,recommender_level,recommended_members
,'xueshandai.dbo.recommend' as src,date_created_max as dt_src
into portrait.dbo.pt_recommend_recommender 
from #2 a 
left outer join (
select referrer_id
,count(1) as recommended_members
,max(date_created) as date_created_max 
from xueshandai.dbo.recommend 
group by referrer_id) b on a.recommender_id=b.referrer_id

select count(1) as c,count(distinct recommender_id) as c2 from portrait.dbo.pt_recommend_recommender
--29423	29423

-- ���Ƽ��˵��Ƽ��ȼ�
drop table portrait.dbo.pt_recommend_recommended
select member_id,referrer_id as recommender_id,b.recommender_level+1 as recommended_level
,'xueshandai.dbo.recommend' as src,a.date_created as dt_src
into portrait.dbo.pt_recommend_recommended
from xueshandai.dbo.recommend a
left outer join portrait.dbo.pt_recommend_recommender b on a.referrer_id=b.recommender_id

select count(1) as c,count(distinct member_id) as c2 from portrait.dbo.pt_recommend_recommended
--635590	635590

use portrait

select * from pt_recommend_recommender where recommender_id=41400
select * from pt_recommend_recommended where member_id=980723


use portrait

select top 10 * from pt_recommend_recommended 

drop table p_recommend_base
select * 
into p_recommend_base 
from (
select recommender_id as id,'is_recommender' as name,'�Ƿ�Ϊ�Ƽ���' as cnname,'1' as value,src,dt_src
FROM pt_recommend_recommender
union all
select recommender_id as id,'recommender_level' as name,'�Ƽ��˵ȼ�' as cnname,cast(recommender_level as varchar) as value,src,dt_src
FROM pt_recommend_recommender
union all
select recommender_id as id,'recommender_recommended_members' as name,'�Ƽ�����' as cnname,cast(recommended_members as varchar) as value,src,dt_src
FROM pt_recommend_recommender

union all

select member_id as id,'is_recommended' as name,'�Ƿ��Ƽ�' as cnname,'1' as value,src,dt_src
FROM pt_recommend_recommended
union all
select member_id as id,'recommender_id' as name,'�Ƽ���id' as cnname,cast(recommender_id as varchar) as value,src,dt_src
FROM pt_recommend_recommended
union all
select member_id as id,'recommended_level' as name,'���Ƽ��ȼ�' as cnname,cast(recommended_level as varchar) as value,src,dt_src
FROM pt_recommend_recommended
) a 

select * from p_recommend_base where id in (980723,41400) order by id,name
