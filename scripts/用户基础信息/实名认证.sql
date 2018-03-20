--实名认证

--check
select count(1) as c,count(distinct member_id) as c2 from xueshandai.dbo.member_credit where status in (2)

drop table portrait.dbo.pt_member_credit
select member_id,status,date_created
,'xueshandai.dbo.member_credit' as src,date_created as dt_src
into portrait.dbo.pt_member_credit
from xueshandai.dbo.member_credit
where status in (2)



select top 10 * from portrait.dbo.pt_member_credit where member_id in (980723)

use portrait

drop table p_member_credit
select member_id as id,'credit_time' as name,'认证时间' as cnname,convert(varchar(20),date_created,120) as value
,src,dt_src
into p_member_credit
from pt_member_credit


select * from p_member_credit where id=980723

