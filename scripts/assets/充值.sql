drop table portrait.dbo.pt_account_recharge

select member_id
,count(1) as nums
,sum(cash) as cash
,min(date_created) as first_time
,'xueshandai.dbo.account_recharge' as src,max(date_created) as dt_src 
into portrait.dbo.pt_account_recharge
from xueshandai.dbo.account_recharge 
where charge_status in (3)
group by member_id

--状态 INIT(""), SUBMITTED("已提交"), DOING("处理中"), SUCCESS("成功"), FAILED("失败")

use portrait
select * from pt_account_recharge where member_id=980723


use portrait

drop table p_account_recharge
select *
into p_account_recharge
from (
select member_id as id,'recharge_nums' as name,'充值次数' as cnname,cast(nums as varchar) as value,src,dt_src
from pt_account_recharge
union all
select member_id as id,'recharge_cash' as name,'充值总额' as cnname,cast(cash as varchar) as value,src,dt_src
from pt_account_recharge
union all 
select member_id as id,'recharge_first_time' as name,'首次充值时间' as cnname,convert(varchar(20),first_time,120) as value,src,dt_src
from pt_account_recharge
) a 

select * from p_account_recharge where id=980723




