use xueshandai
select top 10 * from account

select count(1) as c,count(distinct member_id) as c2  from account

select count(1) as c  from member
--928706

select status,count(1) from member group by status

select * from member where id=980723

select * from member_info where member_id=980723

select top 10 birthday,CONVERT(varchar(10),birthday,120) from member_info where CONVERT(varchar(10),birthday,120)='1979-03-26'



--account����Ǯ��ص�
select * from account where member_id=980723

select * from account_bank where member_id=980723

select bank_name,bank_code,count(1) as c from account_bank group by bank_name,bank_code order by c desc  

--����

--Ͷ���
select top 10 * from borrow_invest

select top 10 * from borrow_invest where investor_id=980723


select CONVERT(varchar(10),activate_time,120) as d,
count(distinct investor_id) as c
,sum(capital) as capital
,sum(interest) as interest
from borrow_invest
where CONVERT(varchar(10),activate_time,120)>='2012'
group by CONVERT(varchar(10),activate_time,120)
order by d

--40234

select status, count(1) as c from borrow_invest group by status

select invest_way, count(1) as c from borrow_invest group by invest_way

select capital_type, count(1) as c from borrow_invest group by capital_type

--�Ƽ���ϵ
select top 10 * from recommend  where member_id=980723


--ע���sid
select top 10 * from ad_access where referer like '%baidu%'

--�

--�Ż�ȯ

--���ֱ�

--�ֽ��


Repayment_Detail  ����˻���

ReceiptDetail Ͷ�ʷ��տ��¼

displacement_detail �渶��

��ģ�lottery_chance ,lottery_award,
select * from lottery_chance 
select * from lottery_award where investor_id=

�Ż݄��ģ�card_coupons_batch ��card_coupons_detail ��

select * from card_coupons_batch where batch_desc like '%�´�%'

select * from card_coupons_detail

�ֽ�transfer_detail  

select top 10 * from transfer_detail where handler_id in (980723) or receiver_id in (980723) 


overdue ����
proceed_invest_freeze �ʽ�ض���
recharge ��ܳ�ֵ
AdAccess ������ͳ��
Repayment_History ������ʷ


���
����
�����
���н�������
�������
��վ�������
�û����� portrait

--���ְ�
select * from card_coupons_detail where batch_id=306 and member_id is not null and use_to is not null

select * from card_coupons_detail where batch_id in (305,306,307) and member_id = 980723
select * from card_coupons_detail where 1=1 and member_id = 980723

select * from Card_Coupons_Batch where batch_desc like '%ע��%'

select * from Card_Coupons_Batch where id in (269)