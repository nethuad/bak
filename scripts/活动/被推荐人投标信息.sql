--被推荐人投标信息
drop table portrait.dbo.pt_recommend_recommended_invest_detail
select a.id as invest_id
,borrow_id
,investor_id
,loaner_id
,capital
,interest
,loan_fee
,loan_fee_rate
,a.status
,activate_time
,invest_way
,a.date_created
,a.last_updated
,b.referrer_id as recommender_id
into portrait.dbo.pt_recommend_recommended_invest_detail
from xueshandai.dbo.borrow_invest a 
inner join xueshandai.dbo.recommend b on a.investor_id = b.member_id
where a.status in (1,2,3)

select * from portrait.dbo.pt_recommend_recommended_invest_detail where investor_id in (980723)


-- 按照推荐人的角度统计的投标信息
drop table portrait.dbo.pt_recommend_recommender_invest

select recommender_id
,count(distinct investor_id) as investors
,sum(capital) as capital
,sum(interest) as interest
,sum(loan_fee) as loan_fee
,'xueshandai.dbo.borrow_invest' as src
,max(last_updated) as dt_src
into portrait.dbo.pt_recommend_recommender_invest
from portrait.dbo.pt_recommend_recommended_invest_detail 
group by recommender_id

select top 10 * from portrait.dbo.pt_recommend_recommender_invest where recommender_id in (41400)
--41400	2	140800.00	2760.71	1418.90


-- 画像数据
use portrait

drop table p_recommend_recommender_invest
select * 
into p_recommend_recommender_invest
from (

select recommender_id as id,'recommender_recommended_investors' as name,'有效推荐人数' as cnname,cast(investors as varchar) as value,src,dt_src
FROM pt_recommend_recommender_invest

union all

select recommender_id as id,'recommender_recommended_capital' as name,'被推荐客户的投标金额' as cnname,cast(capital as varchar) as value,src,dt_src
FROM pt_recommend_recommender_invest

union all

select recommender_id as id,'recommender_recommended_interest' as name,'被推荐客户的投标利息' as cnname,cast(interest as varchar) as value,src,dt_src
FROM pt_recommend_recommender_invest

union all

select recommender_id as id,'recommender_recommended_loanfee' as name,'被推荐客户的投标服务费' as cnname,cast(loan_fee as varchar) as value,src,dt_src
FROM pt_recommend_recommender_invest
) a 

select top 10 * from p_recommend_recommender_invest where id in (980723,41400)



