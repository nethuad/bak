--由于xueshandai.dbo.account_bank的member_id有重复，因此取更新时间大的那个

DROP TABLE portrait.dbo.pt_bank
select *
,'xueshandai.dbo.account_bank' as src,last_updated as dt_src
into portrait.dbo.pt_bank
from (
select member_id,bank_name,bank_sub_name,bank_city_id,bank_code,bank_account,last_updated
,ROW_NUMBER() over(partition by member_id order by last_updated desc ) as rown
from xueshandai.dbo.account_bank
) a where rown=1


select top 10 * from portrait.dbo.pt_bank where member_id in (980723,93697,428415) 

use portrait

drop table p_bank
select *
into p_bank
from (
select member_id as id,'bank_name' as name,'银行名称' as cnname,bank_name as value, src,dt_src
from pt_bank
union all
select member_id as id,'bank_code' as name,'银行代码' as cnname,bank_code as value, src,dt_src
from pt_bank
) a 



select * from portrait.dbo.p_bank where id in (980723)  