
use xueshandai

--话费充值表
select top 5 * from mobile_pay_record where status =3
and member_id=980723


--话费充值/推荐关系/投标信息
drop table #mobile_pay
select a.*
,case when b.id is not null then 1 else 0 end as is_recommended
,case when c.id is not null then 1 else 0 end as is_vest
,case when r.id is not null then r.recommender_id else null end as recommender_id
into #mobile_pay
from (select member_id,count(1) as paytimes,sum(card_num) as paycapital from mobile_pay_record where status =3 group by member_id)a 
left outer join (select distinct id from portrait.dbo.member_base where name='is_recommended' and value='1') b on a.member_id=b.id
left outer join (select distinct id from portrait.dbo.member_base where name='invest_count' and value>'0') c on a.member_id=c.id
left outer join (select id,cast(value as integer) as recommender_id from portrait.dbo.member_base where name='recommender_id' ) r on a.member_id=r.id

select top 10 * from #mobile_pay where is_recommended = 1

--话费
drop table #award

select a.*
,b.id as recommended_id
into #award
from (
select CONVERT(varchar(10) , date_created, 120 ) as d
,capital_type,capital,description,receiver_id
,ltrim(SUBSTRING(description,3,CHARINDEX('首次话费充值，推荐人',description,1)-3)) as recommended_uname 
--,SUBSTRING(description,
--  CHARINDEX('首次话费充值，推荐人',description,1)+LEN('首次话费充值，推荐人'),
--  CHARINDEX('获取奖励',description,1)-CHARINDEX('首次话费充值，推荐人',description,1)-LEN('首次话费充值，推荐人')
-- ) as recommender_uname
from transfer_detail 
where capital_type=13
) a 
left outer join xueshandai.dbo.member b  on a.recommended_uname=b.uname

select top 10 * from #award

drop table #mobile_award
select a.*
,b.receiver_id,b.capital as award,b.d
into #mobile_award
from #mobile_pay a
left outer join #award b on a.member_id=b.recommended_id

select count(1) from #mobile_award

select top 10 * from #mobile_award

drop table #1
select 
case when paytimes>=2 then 2 else paytimes end as paytimes
,is_recommended,is_vest
,case when recommender_id is not null then 1 else 0 end as is_award
,count(1) as members
,sum(paycapital) as paycapital
,sum(award) as award
,count(distinct receiver_id) as recommenders
into #1
from #mobile_award
group by 
case when paytimes>=2 then 2 else paytimes end
,is_recommended,is_vest
,case when recommender_id is not null then 1 else 0 end


drop table #2
select 
is_recommended,is_vest
,case when recommender_id is not null then 1 else 0 end as is_award
,count(1) as members
,sum(paycapital) as paycapital
,sum(award) as award
,count(distinct receiver_id) as recommenders
into #2
from #mobile_award
group by 
is_recommended,is_vest
,case when recommender_id is not null then 1 else 0 end

select * from #2

select * from #1

group by case when c>=2 then 2 else c end,is_recommended,is_vest
order by cc
select * 
from portrait.dbo.member_base 
where id=980723
and name='invest_count' and value>'0'


select * from 

select convert(varchar(7),date_created,120) as d
--,card_num
,count(1) as c
from mobile_pay_record where status =3
group by convert(varchar(7),date_created,120)
--,card_num 
order by d

select status,count(1) as c from mobile_pay_record group by status



select * from portrait.dbo.member_base where id=41400

select top 10 * from mobile_pay_price



drop table #2
select a.*,b.id as recommended_id
into #2
from #1 a 
left outer join xueshandai.dbo.member b on a.recommended_uname=b.uname

select top 10 * 
from #2
where recommended_id is null 

select count(1) from #2

select top 10 * from #2

select count(1) as c ,count(distinct recommended_id) as c2 from #2
--324372	324372



select top 10 * from #3 where recommender_id <> receiver_id

select top 10 * from #3

select count(1) as c from #3

select is_recommended,is_vest
,count(1) as c 
from #3
group by is_recommended,is_vest


select a.*
from #2 a 
left outer join ()


select * from xueshandai.dbo.member where uname = 'an2013' or username='an2013' 

select * 
from transfer_detail 
where capital_type=13
and receiver_id=29034

select a.*,b.id
from #1 a 
left outer join xueshandai.dbo.[member] b on a.recommender_uname = b.uname
where len(a.recommender_uname)>0 
and receiver_id <> id
and 


SELECT CHARINDEX('首次话费充值','会员HGW0621首次话费充值，推荐人64183197获取奖励：10元',1)

select SUBSTRING('会员HGW0621首次话费充值，推荐人64183197获取奖励：10元',3,7)


select CONVERT(varchar(10) , date_created, 120 ) as d
,receiver_id,count(1) as c ,sum(capital) as capital
from transfer_detail 
where capital_type=13
group by CONVERT(varchar(10) , date_created, 120 )
,receiver_id

select receiver_id,count(1) as c ,sum(capital) as capital
from transfer_detail 
where capital_type=13
and CONVERT(varchar(10) , date_created, 120 )>='2017-01-01'
group by receiver_id
order by capital desc 





