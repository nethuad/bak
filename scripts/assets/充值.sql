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

--״̬ INIT(""), SUBMITTED("���ύ"), DOING("������"), SUCCESS("�ɹ�"), FAILED("ʧ��")

use portrait
select * from pt_account_recharge where member_id=980723


use portrait

drop table p_account_recharge
select *
into p_account_recharge
from (
select member_id as id,'recharge_nums' as name,'��ֵ����' as cnname,cast(nums as varchar) as value,src,dt_src
from pt_account_recharge
union all
select member_id as id,'recharge_cash' as name,'��ֵ�ܶ�' as cnname,cast(cash as varchar) as value,src,dt_src
from pt_account_recharge
union all 
select member_id as id,'recharge_first_time' as name,'�״γ�ֵʱ��' as cnname,convert(varchar(20),first_time,120) as value,src,dt_src
from pt_account_recharge
) a 

select * from p_account_recharge where id=980723




