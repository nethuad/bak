--�����Ż�ȯ�Ļ

use xueshandai

-- ��ܱ� Third_Prize_Detail

activity_type:
1,����
2,�Ƽ�Ͷ�ʽ���
3,��Ͷ����
4,Ͷ�ʺ��
5,Ͷ�ʼ�Ϣȯ
6,Ͷ�ʵ���ȯ
7,ѩɽ��ʮ�˼ƻ�
8,ѩɽ����
9,���ÿ������
10,���ÿ������Ƽ��˽���
11,���ѳ�ֵ�Ƽ��˽���
12,ƽ̨��̨ת��
13,���û��Ǩ��
14,��������꽱��
15,���ѳ�ֵ�˿�
16,���ڻ
17,�����ӯ



select distinct capital_type,explain  
from Transfer_Detail 
where capital_type>0 and capital_type not in (12,16,18)
order by capital desc 
where capital_type =  14

vip ��Ͷ���� �׽�VIP 0.2% �ƽ�VIP 0.15% ��ͨVIP 0.1%

select *
select  id,member_id,amount, activity_type,remark,borrow_id,invest_id,investor_id,date_created
from Third_Prize_Detail
where activity_type = 3
and member_id=11175

select CONVERT(varchar(7) , date_created, 120 ) as ym,
sum(amount) as amount 
from Third_Prize_Detail 
where activity_type=3
group by CONVERT(varchar(7) , date_created, 120 )
--2017-12	35555.21
--2018-01	46732.88
--2018-02	35143.00

select CONVERT(varchar(7) , date_created, 120 ) as ym
,sum(amount) as amount 
from Third_Prize_Detail a
where activity_type=3
group by CONVERT(varchar(7) , date_created, 120 )


select activate_time,borrow_id,investor_id,capital,interest,loan_fee,is_vip
from borrow_invest
where status in (1,3)
and is_vip=1
and investor_id=11175


select CONVERT(varchar(7) , activate_time, 120 ) as ym
,sum(capital) as capital
,sum(interest) as interest
,sum(loan_fee) as loan_fee
from borrow_invest a 
inner join (select distinct member_id from Third_Prize_Detail where activity_type=3) b 
on a.investor_id=b.member_id
where activate_time>='2017-12-01'
group by CONVERT(varchar(7) , activate_time, 120 )




select * from member_vip

390	11175	1.20	3	��Ա[��־��]����Ͷ����ת��1.20Ԫ	2017-12-01 12:09:02
391	11175	1.80	3	��Ա[��־��]����Ͷ����ת��1.80Ԫ	2017-12-01 12:09:02
392	11175	0.80	3	��Ա[��־��]����Ͷ����ת��0.80Ԫ	2017-12-01 12:09:03
1785	11175	0.80	3	��Ա[��־��]����Ͷ����ת��0.80Ԫ	2017-12-07 16:09:06
2162	11175	0.40	3	��Ա[��־��]����Ͷ����ת��0.40Ԫ	2017-12-09 21:09:04
2163	11175	0.03	3	��Ա[��־��]����Ͷ����ת��0.03Ԫ	2017-12-09 21:09:04
2559	11175	45.00	3	��Ա[��־��]����Ͷ����ת��45.00Ԫ	2017-12-11 21:09:05

select * from borrow_invest where investor_id = 11175 and activate_time >'2017-11-01'

select a.member_id,a.vip_grade_id,b.grade_name
from vip_renewal a 
inner join vip_grade b on a.vip_grade_id = b.id

where member_id=11175 -- �׽�

select * from vip_grade

select top 10 * from Third_Prize_Detail where member_id=980723

select top 10 * from Third_Prize_Detail where member_id=214303

select status,count(1) from Third_Prize_Detail group by status


select 

select top 10 * from Third_Prize_Detail where activity_type=3

select distinct status from Third_Prize_Detail where activity_type=3



select * from member where id=11175

select * from borrow_invest where investor_id=11175


select 


platcust: �����˻�



select activity_type
,count(1) as c 
from Third_Prize_Detail 
group by activity_type 
order by activity_type

select * from member where id=32707

--��Ͷ����
select top 100 * from Third_Prize_Detail where activity_type=3


select * from Doubble_Section_Award where prize like '%��Ͷ%'




select top 10 * from card_coupons_detail where 

select id,category from card_coupons_batch where batch_desc like 'ע������%'




select CONVERT(varchar(7) , reg_time, 120 ) as ym,is_valid_idcard,count(1) as members
from member
where is_valid_idcard=1
group  by CONVERT(varchar(7) , reg_time, 120 ),is_valid_idcard
order by ym,is_valid_idcard


--112���Ըĳ�111��21��120��108�Ⱥܶ�����������ʾ��ͬ�ĸ�ʽ

select 
convert(varchar(20),getdate(),112) as t112
,convert(varchar(20),getdate(),111) as t111
,convert(varchar(20),getdate(),120) as t120



