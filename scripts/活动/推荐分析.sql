
-- Ͷ�����������Ƽ�����
select a.*
,case when b.invest_id is null THEN 0 else 1 end as is_recommend
,b.recommend_rate
,b.prize as recommend_prize
,b.borrow_id as borrow_id_b
,b.member_id as member_id_b
,b.recommend_id as recommend_id_b
,r.member_id as member_id_r
,r.referrer_id as referrer_id_r
into portrait.dbo.borrow_invest_recommend
from borrow_invest a 
left outer join ( select * from recommend_invest where RECOMMEND_TYPE=0) b on a.id=b.invest_id   --RECOMMEND_TYPE��   REFERRER("�Ƽ���"),  REG("���Ƽ���")��ֻȡ�Ƽ��˵�����
left outer join recommend r on b.recommend_id = r.id

select top 10 * from portrait.dbo.borrow_invest_recommend where investor_id=980723




select a.activate_ym,a.capital as capital_nr,a.interest as interest_nr, a.loan_fee as loan_fee_nr
, b.capital as capital_r,b.interest as interest_r, b.loan_fee as loan_fee_r,b.recommend_prize
,(a.capital+b.capital) as capital_total, (a.interest+b.interest) as interest_total,(a.loan_fee+b.loan_fee) as loan_fee_total
into portrait.dbo.rp_borrow_invest_recommend
from (
select
CONVERT(varchar(7) , activate_time, 120 ) as activate_ym
,is_recommend
,sum(capital) as capital
,sum(interest) as interest
,sum(loan_fee) as loan_fee
,sum(recommend_prize) as recommend_prize
from portrait.dbo.borrow_invest_recommend
where status in (1,3) and is_recommend = 0
and activate_time is not null
group by CONVERT(varchar(7) , activate_time, 120 ),is_recommend
) a 
left outer join (
select
CONVERT(varchar(7) , activate_time, 120 ) as activate_ym
,is_recommend
,sum(capital) as capital
,sum(interest) as interest
,sum(loan_fee) as loan_fee
,sum(recommend_prize) as recommend_prize
from #1
where status in (1,3) and is_recommend = 1
and activate_time is not null
group by CONVERT(varchar(7) , activate_time, 120 ),is_recommend
) b on a.activate_ym = b.activate_ym

--����һ
select activate_ym as ����
, capital_nr as Ͷ��_���Ƽ�
, loan_fee_nr as �����_���Ƽ�
, capital_r as Ͷ��_�Ƽ�
, loan_fee_r as �����_�Ƽ�
, recommend_prize as �Ƽ�����
, capital_total as Ͷ��_�ܼ�, loan_fee_total as �����_�ܼ�
,capital_r*1.0/capital_total as Ͷ���Ƽ�ռ��,loan_fee_r*1.0/loan_fee_total as ������Ƽ�ռ��
,recommend_prize*1.0/loan_fee_r as �Ƽ�����_div_�Ƽ������,recommend_prize*1.0/loan_fee_total as �Ƽ�����_div_�ܷ����
from portrait.dbo.rp_borrow_invest_recommend
order by activate_ym


-- �û��Ƽ�����
--select a.id as member_id
--,case when b.member_id is null and c.recommender_id is null then '��ͨ'
--when b.member_id is null and c.recommender_id is not null  then '�Ƽ��û�'
--when b.member_id is not null and c.recommender_id is null then '���Ƽ��û�'
--when b.member_id is not null and c.recommender_id is not null and c.recommender_level=1 then '���״��Ƽ����Ƽ��û�'
--when b.member_id is not null and c.recommender_id is not null and c.recommender_level>1 then '��2�μ������Ƽ����Ƽ��û�'
--end as member_recommend_type
--into portrait.dbo.member_recommend_type
--from member a
--left outer join portrait.dbo.member_recommended_level b on a.id=b.member_id
--left outer join portrait.dbo.recommender_level c on a.id = c.recommender_id

drop table portrait.dbo.member_recommend_type
select a.id as member_id
,case when b.member_id is null and c.recommender_id is null then '��ͨ'
when b.member_id is null and c.recommender_id is not null  then '�����Ƽ��û�'
when b.member_id is not null and b.recommended_level=1 then '���Ƽ��û�-1'
when b.member_id is not null and b.recommended_level=2 then '���Ƽ��û�-2'
when b.member_id is not null and b.recommended_level>=3 then '���Ƽ��û�3�㼰����'
end as member_recommend_type
into portrait.dbo.member_recommend_type
from member a
left outer join portrait.dbo.member_recommended_level b on a.id=b.member_id
left outer join portrait.dbo.recommender_level c on a.id = c.recommender_id

select member_recommend_type,count(1) as c from portrait.dbo.member_recommend_type group by member_recommend_type 
��ͨ	286024
�����Ƽ��û�	7084
���Ƽ��û�-1	167664
���Ƽ��û�-2	133456
���Ƽ��û�3�㼰����	334470


select recommended_level,count(1) as c from portrait.dbo.member_recommended_level group by recommended_level 
1	167664
2	133456
3	117608
4	94439

select * from portrait.dbo.recommender_level where 

select * from portrait.dbo.member_recommended_level where member_id in (980723,41400)
select * from portrait.dbo.member_recommend_type where member_id in (980723,41400)

--�����û�Ͷ��
select 
CONVERT(varchar(7) , activate_time, 120 ) as activate_ym
,b.member_recommend_type
,count(distinct investor_id) as members
,sum(capital) as capital
from borrow_invest a 
inner join  portrait.dbo.member_recommend_type b on a.investor_id = b.member_id
where a.status in (1,3) and activate_time is not null
group by CONVERT(varchar(7) , activate_time, 120 ),b.member_recommend_type









