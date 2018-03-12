
--SELECT * FROM xueshandai.dbo.member

drop table portrait.dbo.t_member

--�û���
select id,'uname' as name,'�û�����' as cnname,uname as value,coalesce(last_updated,date_created) AS dt_src
into portrait.dbo.t_member
FROM xueshandai.dbo.member

union all 

--��ʵ����
select id,'real_name' as name,'��ʵ����' as cnname,real_name as value,coalesce(last_updated,date_created) AS dt_src
FROM xueshandai.dbo.member

union all

--ע��ʱ��
select id,'reg_time' as name,'ע��ʱ��' as cnname,CONVERT(varchar(20),reg_time,120) as value,coalesce(last_updated,date_created) AS dt_src
FROM xueshandai.dbo.member

union all

--ע��ip
select id,'reg_id' as name,'ע��ip' as cnname,reg_ip as value,coalesce(last_updated,date_created) AS dt_src
FROM xueshandai.dbo.member

union all

--ע��referer
select id,'reg_referer' as name,'ע��referer' as cnname,reg_referer as value,coalesce(last_updated,date_created) AS dt_src
FROM xueshandai.dbo.member

union all

--ע������
select id,'reg_way' as name,'ע������' as cnname,reg_way as value,coalesce(last_updated,date_created) AS dt_src
FROM xueshandai.dbo.member

union all

--��¼ʱ��
select id,'last_login_time' as name,'���һ�ε�¼ʱ��' as cnname,CONVERT(varchar(20),last_login_time,120) as value,coalesce(last_updated,date_created) AS dt_src
FROM xueshandai.dbo.member

union all

--email
select id,'email' as name,'�����ʼ�' as cnname,email as value,coalesce(last_updated,date_created) AS dt_src
FROM xueshandai.dbo.member

union all

--is_valid_email
select id,'is_valid_email' as name,'�Ƿ���Ч�����ʼ�' as cnname,cast(is_valid_email as varchar)  as value,coalesce(last_updated,date_created) AS dt_src
FROM xueshandai.dbo.member

union all

--mobile
select id,'mobile' as name,'�ֻ�' as cnname,mobile as value,coalesce(last_updated,date_created) AS dt_src
FROM xueshandai.dbo.member

union all

--is_valid_mobile
select id,'is_valid_mobile' as name,'�Ƿ���Ч�ֻ�' as cnname,cast(is_valid_mobile as varchar) as value,coalesce(last_updated,date_created) AS dt_src
FROM xueshandai.dbo.member

union all

--idcard
select id,'idcard' as name,'���֤' as cnname,idcard as value,coalesce(last_updated,date_created) AS dt_src
FROM xueshandai.dbo.member

union all

--is_valid_idcard
select id,'is_valid_idcard' as name,'�Ƿ���Ч���֤' as cnname,cast(is_valid_idcard as varchar) as value,coalesce(last_updated,date_created) AS dt_src
FROM xueshandai.dbo.member

union all

--is_vip
select id,'is_vip' as name,'�Ƿ�vip' as cnname,cast(is_vip as varchar) as value,coalesce(last_updated,date_created) AS dt_src
FROM xueshandai.dbo.member

union all

--vip_end_date
select id,'vip_end_date' as name,'vip����ʱ��' as cnname,CONVERT(varchar(20),vip_end_date,120) as value,coalesce(last_updated,date_created) AS dt_src
FROM xueshandai.dbo.member

union all

--is_company
select id,'is_company' as name,'�Ƿ�˾' as cnname,cast(is_company as varchar) as value,coalesce(last_updated,date_created) AS dt_src
FROM xueshandai.dbo.member

union all

--auth_reason
select id,'auth_reason' as name,'��֤���' as cnname,auth_reason as value,coalesce(last_updated,date_created) AS dt_src
FROM xueshandai.dbo.member

union all

--is_admin
select id,'is_admin' as name,'�Ƿ����Ա' as cnname,cast(is_admin as varchar) as value,coalesce(last_updated,date_created) AS dt_src
FROM xueshandai.dbo.MEMBER

