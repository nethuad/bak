--�û�������Ϣ��
DROP TABLE portrait.dbo.pt_member
SELECT id
,'xueshandai.dbo.member' as src
,coalesce(last_updated,date_created) AS dt_src
,uname -- �û�����
,real_name --��ʵ����
,reg_time --ע��ʱ��
,reg_ip --ע��ip
,reg_referer --ע��referer
,case when reg_way like 'Android%' then 'Android' else reg_way end as reg_way --ע������
,last_login_time --���һ�ε�¼ʱ��
,email --�����ʼ�
,is_valid_email --�Ƿ���Ч�����ʼ�
,mobile --�ֻ�����
,is_valid_mobile --�Ƿ���Ч�ֻ�����
,idcard --���֤
,is_valid_idcard --�Ƿ���Ч���֤
,is_vip --�Ƿ�vip�ͻ�
,vip_end_date --vip����ʱ��
,is_company --�Ƿ�˾�ͻ�
,auth_reason --��֤���
,is_admin --�Ƿ����Ա
into portrait.dbo.pt_member
FROM xueshandai.dbo.MEMBER

select * from portrait.dbo.pt_member WHERE id = 980723


--�û�����-�û�������
use portrait
drop table p_member
select * 
into p_member
from ( 
select id,'uname' as name,'�û�����' as cnname,uname as value,src,dt_src
FROM pt_member
union all 
select id,'real_name' as name,'��ʵ����' as cnname,real_name as value,src,dt_src
FROM pt_member
union all
select id,'reg_time' as name,'ע��ʱ��' as cnname,CONVERT(varchar(20),reg_time,120) as value,src,dt_src
FROM pt_member
union all
select id,'reg_id' as name,'ע��ip' as cnname,reg_ip as value,src,dt_src
FROM pt_member
union all
select id,'reg_referer' as name,'ע��referer' as cnname,reg_referer as value,src,dt_src
FROM pt_member
union all
select id,'reg_way' as name,'ע������' as cnname,reg_way as value,src,dt_src
FROM pt_member
union all
select id,'last_login_time' as name,'���һ�ε�¼ʱ��' as cnname,CONVERT(varchar(20),last_login_time,120) as value,src,dt_src
FROM pt_member
union all
select id,'email' as name,'�����ʼ�' as cnname,email as value,src,dt_src
FROM pt_member
union all
select id,'is_valid_email' as name,'�Ƿ���Ч�����ʼ�' as cnname,cast(is_valid_email as varchar)  as value,src,dt_src
FROM pt_member
union all
select id,'mobile' as name,'�ֻ�' as cnname,mobile as value,src,dt_src
FROM pt_member
union all
select id,'is_valid_mobile' as name,'�Ƿ���Ч�ֻ�' as cnname,cast(is_valid_mobile as varchar) as value,src,dt_src
FROM pt_member
union all
select id,'idcard' as name,'���֤' as cnname,idcard as value,src,dt_src
FROM pt_member
union all
select id,'is_valid_idcard' as name,'�Ƿ���Ч���֤' as cnname,cast(is_valid_idcard as varchar) as value,src,dt_src
FROM pt_member
union all
select id,'is_vip' as name,'�Ƿ�vip' as cnname,cast(is_vip as varchar) as value,src,dt_src
FROM pt_member
union all
select id,'vip_end_date' as name,'vip����ʱ��' as cnname,CONVERT(varchar(20),vip_end_date,120) as value,src,dt_src
FROM pt_member
union all
select id,'is_company' as name,'�Ƿ�˾' as cnname,cast(is_company as varchar) as value,src,dt_src
FROM pt_member
union all
select id,'auth_reason' as name,'��֤���' as cnname,auth_reason as value,src,dt_src
FROM pt_member
union all
select id,'is_admin' as name,'�Ƿ����Ա' as cnname,cast(is_admin as varchar) as value,src,dt_src
FROM pt_member
) a 

select * from p_member WHERE id = 980723

