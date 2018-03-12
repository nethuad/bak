
--SELECT * FROM xueshandai.dbo.member

drop table portrait.dbo.t_member

--用户名
select id,'uname' as name,'用户名称' as cnname,uname as value,coalesce(last_updated,date_created) AS dt_src
into portrait.dbo.t_member
FROM xueshandai.dbo.member

union all 

--真实姓名
select id,'real_name' as name,'真实姓名' as cnname,real_name as value,coalesce(last_updated,date_created) AS dt_src
FROM xueshandai.dbo.member

union all

--注册时间
select id,'reg_time' as name,'注册时间' as cnname,CONVERT(varchar(20),reg_time,120) as value,coalesce(last_updated,date_created) AS dt_src
FROM xueshandai.dbo.member

union all

--注册ip
select id,'reg_id' as name,'注册ip' as cnname,reg_ip as value,coalesce(last_updated,date_created) AS dt_src
FROM xueshandai.dbo.member

union all

--注册referer
select id,'reg_referer' as name,'注册referer' as cnname,reg_referer as value,coalesce(last_updated,date_created) AS dt_src
FROM xueshandai.dbo.member

union all

--注册渠道
select id,'reg_way' as name,'注册渠道' as cnname,reg_way as value,coalesce(last_updated,date_created) AS dt_src
FROM xueshandai.dbo.member

union all

--登录时间
select id,'last_login_time' as name,'最后一次登录时间' as cnname,CONVERT(varchar(20),last_login_time,120) as value,coalesce(last_updated,date_created) AS dt_src
FROM xueshandai.dbo.member

union all

--email
select id,'email' as name,'电子邮件' as cnname,email as value,coalesce(last_updated,date_created) AS dt_src
FROM xueshandai.dbo.member

union all

--is_valid_email
select id,'is_valid_email' as name,'是否有效电子邮件' as cnname,cast(is_valid_email as varchar)  as value,coalesce(last_updated,date_created) AS dt_src
FROM xueshandai.dbo.member

union all

--mobile
select id,'mobile' as name,'手机' as cnname,mobile as value,coalesce(last_updated,date_created) AS dt_src
FROM xueshandai.dbo.member

union all

--is_valid_mobile
select id,'is_valid_mobile' as name,'是否有效手机' as cnname,cast(is_valid_mobile as varchar) as value,coalesce(last_updated,date_created) AS dt_src
FROM xueshandai.dbo.member

union all

--idcard
select id,'idcard' as name,'身份证' as cnname,idcard as value,coalesce(last_updated,date_created) AS dt_src
FROM xueshandai.dbo.member

union all

--is_valid_idcard
select id,'is_valid_idcard' as name,'是否有效身份证' as cnname,cast(is_valid_idcard as varchar) as value,coalesce(last_updated,date_created) AS dt_src
FROM xueshandai.dbo.member

union all

--is_vip
select id,'is_vip' as name,'是否vip' as cnname,cast(is_vip as varchar) as value,coalesce(last_updated,date_created) AS dt_src
FROM xueshandai.dbo.member

union all

--vip_end_date
select id,'vip_end_date' as name,'vip结束时间' as cnname,CONVERT(varchar(20),vip_end_date,120) as value,coalesce(last_updated,date_created) AS dt_src
FROM xueshandai.dbo.member

union all

--is_company
select id,'is_company' as name,'是否公司' as cnname,cast(is_company as varchar) as value,coalesce(last_updated,date_created) AS dt_src
FROM xueshandai.dbo.member

union all

--auth_reason
select id,'auth_reason' as name,'认证结果' as cnname,auth_reason as value,coalesce(last_updated,date_created) AS dt_src
FROM xueshandai.dbo.member

union all

--is_admin
select id,'is_admin' as name,'是否管理员' as cnname,cast(is_admin as varchar) as value,coalesce(last_updated,date_created) AS dt_src
FROM xueshandai.dbo.MEMBER

