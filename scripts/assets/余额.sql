
select member_id,available as cash
,'account' as src
,last_updated as dt_src
into portrait.dbo.pt_account_cash
from xueshandai.dbo.account
where type='cash'


select * from portrait.dbo.pt_account_cash where member_id=980723


use portrait

drop table p_account_cash
select member_id as id,'cash' as name,'”‡∂Ó ' as cnname,cast(cash as varchar) as value,src,dt_src
into p_account_cash
from pt_account_cash

select * from p_account_cash where id=980723

