
use xueshandai

select distinct category from card_coupons_batch where batch_desc like '注册赠送%'
--category=2 表示都是红包

drop table #1
select * 
,CONVERT(varchar(7) , valid_date, 120 ) as ym
,case when status in (1,5) then 1 else 0 end as is_used
,case when use_to is null then 0 else 1 end as is_useto --用于校验
into #1
from card_coupons_detail 
where batch_id in (select id from card_coupons_batch where batch_desc like '注册赠送%')
and member_id is not null



select a.*
,b.members as members_used
,b.amount as amount_used
into portrait.dbo.rp_reg_coupons
from (
select ym,count(distinct member_id) as members,sum(amount) as amount
from #1
group by ym
) a 
left outer join (
select ym,count(distinct member_id) as members,sum(amount) as amount
from #1
where is_used=1
group by ym
) b on a.ym=b.ym
order by ym

select ym as 年月
,members as 发放人数,amount as 发放金额, amount/members as 人均发放金额
,members_used as 使用人数,amount_used as 使用金额, amount_used/members_used as 人均使用金额
,members_used*1.0/members as 使用率_人,amount_used*1.0/amount as 使用率_金额
from portrait.dbo.rp_reg_coupons 
order by ym


