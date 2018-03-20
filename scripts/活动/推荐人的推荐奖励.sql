--推荐人的推荐奖励
drop table portrait.dbo.pt_recommend_recommender_prize_detail
select invest_id,a.member_id,prize,recommend_id,recommend_rate,borrow_id,recommend_type 
,b.referrer_id as recommender_id
,'xueshandai.dbo.recommend_invest' as src
,a.last_updated as dt_src
into portrait.dbo.pt_recommend_recommender_prize_detail
from xueshandai.dbo.recommend_invest a
inner join xueshandai.dbo.recommend b on a.recommend_id = b.id
where recommend_type=0

select * from portrait.dbo.pt_recommend_recommender_prize_detail where member_id = 980723

use portrait

drop table pt_recommend_recommender_prize

select recommender_id 
,sum(prize) as prize
,'xueshandai.dbo.recommend_invest' as src,max(dt_src) as dt_src
into pt_recommend_recommender_prize
from pt_recommend_recommender_prize_detail
group by recommender_id


select * from pt_recommend_recommender_prize where recommender_id=41400


--画像数据 
drop table p_award_recommender_recommend
select recommender_id as id,'award_recommender_recommend' as name,'推荐人的推荐奖励' as cnname,cast(prize as varchar) as value,src,dt_src
into p_award_recommender_recommend
from pt_recommend_recommender_prize


select * from p_award_recommender_recommend where id=41400