--Ͷ����Ϣ
drop table portrait.dbo.pt_invest_detail
select id as invest_id
,borrow_id
,investor_id
,loaner_id
,capital
,interest
,loan_fee
,loan_fee_rate
,status
,activate_time
,invest_way
,date_created
,last_updated
into portrait.dbo.pt_invest_detail
FROM xueshandai.dbo.borrow_invest
where status in (1,2,3)

SELECT top 10 * FROM xueshandai.dbo.borrow_invest
--status : 0-UN_EFFECTIVE("δ��Ч"), 1-EFFECTIVE("��Ч"), 2-RUN_OFF("����"), 3-REPAID("�ѻ���")

select * from portrait.dbo.pt_invest where investor_id = 980723

use portrait

drop table pt_invest_succ

select investor_id
,count(1) as invest_count
,count(distinct invest_way) as invest_ways
,sum(capital) as capital
,sum(interest) as interest
,sum(loan_fee) as loan_fee
,min(activate_time) as first_invest_time
,max(activate_time) as last_invest_time
,'xueshandai.dbo.borrow_invest' as src
,max(last_updated) as dt_src
into pt_invest_succ
from pt_invest_detail
where status in (1,3) 
group by investor_id

select * from pt_invest_succ where investor_id=980723


--��״̬��Ͷ��
drop table pt_invest_status
select investor_id,status
,count(1) as invest_count
,sum(capital) as capital
,sum(interest) as interest
,sum(loan_fee) as loan_fee
,max(activate_time) as last_invest_time
,'xueshandai.dbo.borrow_invest' as src
,max(last_updated) as dt_src
into pt_invest_status
from pt_invest_detail
where status in (1,2,3)
group by investor_id,status

select * from pt_invest_status where investor_id in (980723)

drop table pt_invest_way
select a.investor_id
,a.invest_way as invest_way_most
,b.invest_way as invest_way_last
,'xueshandai.dbo.borrow_invest' as src
,b.activate_time as dt_src
into pt_invest_way
from (
--����Ͷ������
select investor_id,invest_way,invest_count 
from (
select investor_id,invest_way,invest_count
,ROW_NUMBER() over(partition by investor_id order by invest_count desc ) as rown
from (
select investor_id,invest_way,count(1) as invest_count
from pt_invest_detail
group by investor_id,invest_way
) a
) a where rown=1
) a 
left outer join (
--���һ��Ͷ������
select investor_id,invest_way,activate_time
from (
select investor_id,invest_way,activate_time
,ROW_NUMBER() over(partition by investor_id order by activate_time desc ) as rown
from pt_invest_detail
) a where rown=1
) b on a.investor_id=b.investor_id

select count(1) as c,count(distinct investor_id) from pt_invest_way

select * from pt_invest_way where investor_id=980723


select top 10 * from pt_invest_way

drop table p_invest
select * 
into p_invest 
from (
select investor_id as id,'invest_count' as name,'Ͷ�����' as cnname,cast(invest_count as varchar) as value,src,dt_src
FROM pt_invest_succ
union all 
select investor_id as id,'invest_ways' as name,'Ͷ�����������' as cnname,cast(invest_ways as varchar) as value,src,dt_src
FROM pt_invest_succ
union all
select investor_id as id,'invest_capital' as name,'Ͷ���ܶ�' as cnname,cast(capital as varchar) as value,src,dt_src
FROM pt_invest_succ
union all 
select investor_id as id,'invest_interest' as name,'Ͷ����Ϣ' as cnname,cast(interest as varchar) as value,src,dt_src
FROM pt_invest_succ
union all 
select investor_id as id,'loan_fee' as name,'Ͷ������' as cnname,cast(loan_fee as varchar) as value,src,dt_src
FROM pt_invest_succ
union all
select investor_id as id,'first_invest_time' as name,'�״�Ͷ��ʱ��' as cnname,CONVERT(varchar(20),first_invest_time,120)  as value,src,dt_src
FROM pt_invest_succ
union all
select investor_id as id,'last_invest_time' as name,'���һ��Ͷ��ʱ��' as cnname,CONVERT(varchar(20),last_invest_time,120)  as value,src,dt_src
FROM pt_invest_succ

union all
select investor_id as id,'curr_invest_count' as name,'��ǰͶ����' as cnname,cast(invest_count as varchar) as value,src,dt_src
FROM pt_invest_status
where status = 1
union all
select investor_id as id,'curr_invest_capital' as name,'��ǰͶ���ܶ�' as cnname,cast(capital as varchar) as value,src,dt_src
FROM pt_invest_status
where status = 1
union all
select investor_id as id,'runoff_invest_count' as name,'������' as cnname,cast(invest_count as varchar) as value,src,dt_src
FROM pt_invest_status
where status = 2

union all
select investor_id as id,'invest_way_most' as name,'����Ͷ������' as cnname, invest_way_most as value,src,dt_src
FROM pt_invest_way 
union all
select investor_id as id,'invest_way_last' as name,'���һ��Ͷ������' as cnname, invest_way_last as value,src,dt_src
FROM pt_invest_way

) a 

select * from p_invest where id=980723

