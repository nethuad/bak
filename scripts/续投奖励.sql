use xueshandai

select * from proceed_invest_freeze

��Ͷ������ �� Proceed_Invest_Prize�� 
status : 0-NONE("��ʼ"), 1-SUCCESS("�ɹ�"), 2-FAIL("ȡ������")
event_source: ��Ӧborrow_invest��id

drop table #1
select
event_source as invest_id
,a.date_created,handle_time
,convert_capital,convert_rate,cash_capital
,in_comer_id,proceed_invest_pool_id
,a.status as status_process,allow_grant
,b.activate_time
,b.investor_id
,b.capital
,b.interest
,b.loan_fee
,b.status
into #1
from proceed_invest_prize a 
left outer join borrow_invest b on a.event_source = b.id
where a.status=1 

select * from borrow_invest

--check
select status,count(1) as c from #1 group by status
select * from #1 where in_comer_id<>investor_id
select * from #1 where convert_capital>capital
select * from #1 where status is null



select CONVERT(varchar(7) , activate_time, 120 ) as ym
,count(distinct investor_id) as members
,sum(capital) as capital
,sum(convert_capital) as convert_capital
,sum(interest) as interest
,sum(loan_fee) as loan_fee
,sum(cash_capital) as proceed_prize
into portrait.dbo.rp_proceed_prize
from #1
where status=1
group by CONVERT(varchar(7) , activate_time, 120 )
order by ym

select ym as ����
,members as ��Ͷ�û���
,capital as Ͷ����
,convert_capital as ��Ͷ���
,loan_fee as �����
,proceed_prize as ��Ͷ����
,proceed_prize/convert_capital as ��Ͷ������
,convert_capital/capital as ��Ͷ���_div_Ͷ����
,proceed_prize/loan_fee as ��Ͷ����_div_�����
from portrait.dbo.rp_proceed_prize
order by ym











