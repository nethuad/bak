
use xueshandai

select distinct category from card_coupons_batch where batch_desc like 'ע������%'
--category=2 ��ʾ���Ǻ��

drop table #1
select * 
,CONVERT(varchar(7) , valid_date, 120 ) as ym
,case when status in (1,5) then 1 else 0 end as is_used
,case when use_to is null then 0 else 1 end as is_useto --����У��
into #1
from card_coupons_detail 
where batch_id in (select id from card_coupons_batch where batch_desc like 'ע������%')
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

select ym as ����
,members as ��������,amount as ���Ž��, amount/members as �˾����Ž��
,members_used as ʹ������,amount_used as ʹ�ý��, amount_used/members_used as �˾�ʹ�ý��
,members_used*1.0/members as ʹ����_��,amount_used*1.0/amount as ʹ����_���
from portrait.dbo.rp_reg_coupons 
order by ym


