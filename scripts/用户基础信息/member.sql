--用户基础信息表
DROP TABLE portrait.dbo.pt_member
SELECT id
,'xueshandai.dbo.member' as src
,coalesce(last_updated,date_created) AS dt_src
,uname -- 用户名称
,real_name --真实姓名
,reg_time --注册时间
,reg_ip --注册ip
,reg_referer --注册referer
,case when reg_way like 'Android%' then 'Android' else reg_way end as reg_way --注册渠道
,last_login_time --最后一次登录时间
,email --电子邮件
,is_valid_email --是否有效电子邮件
,mobile --手机号码
,is_valid_mobile --是否有效手机号码
,idcard --身份证
,is_valid_idcard --是否有效身份证
,is_vip --是否vip客户
,vip_end_date --vip结束时间
,is_company --是否公司客户
,auth_reason --认证结果
,is_admin --是否管理员
into portrait.dbo.pt_member
FROM xueshandai.dbo.MEMBER

select * from portrait.dbo.pt_member WHERE id = 980723


--用户画像-用户基础表
use portrait
drop table p_member
select * 
into p_member
from ( 
select id,'uname' as name,'用户名称' as cnname,uname as value,src,dt_src
FROM pt_member
union all 
select id,'real_name' as name,'真实姓名' as cnname,real_name as value,src,dt_src
FROM pt_member
union all
select id,'reg_time' as name,'注册时间' as cnname,CONVERT(varchar(20),reg_time,120) as value,src,dt_src
FROM pt_member
union all
select id,'reg_id' as name,'注册ip' as cnname,reg_ip as value,src,dt_src
FROM pt_member
union all
select id,'reg_referer' as name,'注册referer' as cnname,reg_referer as value,src,dt_src
FROM pt_member
union all
select id,'reg_way' as name,'注册渠道' as cnname,reg_way as value,src,dt_src
FROM pt_member
union all
select id,'last_login_time' as name,'最后一次登录时间' as cnname,CONVERT(varchar(20),last_login_time,120) as value,src,dt_src
FROM pt_member
union all
select id,'email' as name,'电子邮件' as cnname,email as value,src,dt_src
FROM pt_member
union all
select id,'is_valid_email' as name,'是否有效电子邮件' as cnname,cast(is_valid_email as varchar)  as value,src,dt_src
FROM pt_member
union all
select id,'mobile' as name,'手机' as cnname,mobile as value,src,dt_src
FROM pt_member
union all
select id,'is_valid_mobile' as name,'是否有效手机' as cnname,cast(is_valid_mobile as varchar) as value,src,dt_src
FROM pt_member
union all
select id,'idcard' as name,'身份证' as cnname,idcard as value,src,dt_src
FROM pt_member
union all
select id,'is_valid_idcard' as name,'是否有效身份证' as cnname,cast(is_valid_idcard as varchar) as value,src,dt_src
FROM pt_member
union all
select id,'is_vip' as name,'是否vip' as cnname,cast(is_vip as varchar) as value,src,dt_src
FROM pt_member
union all
select id,'vip_end_date' as name,'vip结束时间' as cnname,CONVERT(varchar(20),vip_end_date,120) as value,src,dt_src
FROM pt_member
union all
select id,'is_company' as name,'是否公司' as cnname,cast(is_company as varchar) as value,src,dt_src
FROM pt_member
union all
select id,'auth_reason' as name,'认证结果' as cnname,auth_reason as value,src,dt_src
FROM pt_member
union all
select id,'is_admin' as name,'是否管理员' as cnname,cast(is_admin as varchar) as value,src,dt_src
FROM pt_member
) a 

select * from p_member WHERE id = 980723

