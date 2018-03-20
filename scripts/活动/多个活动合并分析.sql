use xueshandai

--����

drop table #six
select CONVERT(varchar(10) , a.date_created, 120 ) as d
,a.member_id,a.invest_id,a.capital,a.award
into #six
from Member_Recommend_Award a
inner join borrow_invest b on a.invest_id=b.id

select count(distinct member_id) as members,sum(award) as award from #six
--184 1573800

--���ʮ�˵Ľ���

drop table #ten
select receiver_id as member_id,capital as award,CONVERT(varchar(10) , date_created, 120 ) as d
into #ten
from Transfer_Detail 
where capital_type = 14

select count(distinct member_id) as members ,sum(award) as award from #ten
--43	139356

-- ����+ʮ��
���Ƽ��˵Ķ�Ӧ��ϵ

drop table #1
select distinct member_id  into #1 from #six

drop table #2
select distinct member_id into #2 from #ten

select distinct a.member_id
,case when b.member_id is not null then 1 else 0 end as is_six
,case when c.member_id is not null then 1 else 0 end as is_ten
into #member_sixten
from (
select member_id from #1
union all
select member_id from #2
) a 
left outer join #1 b on a.member_id=b.member_id
left outer join #2 c on a.member_id=c.member_id

select * from #member_sixten

select is_six,is_ten,count(1) as c from #member_sixten group by is_six,is_ten
--is_six	is_ten	c
--1	0	169
--0	1	28
--1	1	15

--�����Ƽ�����
drop table #recommend_prize
select CONVERT(varchar(10) , a.date_created, 120 ) as d
,a.prize,a.member_id,r.referrer_id as recommender_id
into #recommend_prize
from ( 
select * from recommend_invest where RECOMMEND_TYPE=0
) a 
inner join recommend r on a.recommend_id = r.id
--inner join #member_sixten b on r.referrer_id = b.member_id

select * from #recommend_prize

select count(distinct recommender_id) as recommenders,count(distinct member_id ) as recommendeds 
from #recommend_prize


--�����ϲ�
drop table #award
select *
into #award
from (
select member_id,award,d,'six' as atype 
from #six
union all
select member_id,award,d,'ten' as atype 
from #ten
union all 
select recommender_id as member_id,prize as award,d,'recommend' as atype
from #recommend_prize
) a 




select top 10 * from recommend
--���Ƽ���
drop table #member_recommended
select a.referrer_id as recommender_id,a.member_id
into #member_recommended
from recommend a 
--inner join #member_sixten b on a.referrer_id = b.member_id


select * from #member_recommended

--�Ƽ���Ͷ��
drop table #recommender_invest
select CONVERT(varchar(10) , date_created, 120 ) as d
,investor_id as member_id,capital
into #recommender_invest
from borrow_invest a 
--inner join #member_sixten b on a.investor_id=b.member_id
inner join (select distinct recommender_id from #member_recommended) b on a.investor_id=b.recommender_id
where status in (1,3) and activate_time is not null



--�����Ƽ��˼��㱻�Ƽ���Ͷ��
drop table #recommender_recommended_invest
select CONVERT(varchar(10) , date_created, 120 ) as d
,recommender_id,member_id,capital
into #recommender_recommended_invest
from borrow_invest a 
--inner join #member_recommended b on a.investor_id=b.member_id
inner join #member_recommended b on a.investor_id=b.member_id
where status in (1,3) and activate_time is not null


select * from #recommender_recommended_invest 

--�Ƽ��˸�����Ϣ
�Ƽ���ע������,�ȼ�

-- ����
drop table #sum
select a.member_id,is_six,is_ten
,case when is_six=1 and is_ten=0 then '����' when is_six=0 and is_ten=1 then 'ʮ��' when is_six=1 and is_ten=1 then '����+ʮ��' else '����' end as rtype
, CONVERT(varchar(10) , reg_time, 120 ) as reg_day
,case when aw1.member_id is null then 0 else aw1.award end as award_six
,case when aw2.member_id is null then 0 else aw2.award end as award_ten
,case when aw3.member_id is null then 0 else aw3.award end as award_recommend
,case when c.recommender_id is null then 0 else c.recommendeds end as recommendeds
,case when v1.member_id is null then 0 else v1.capital end as recommender_capital
,case when v2.recommender_id is null then 0 else v2.recommendeds end as recommendeds_invest
,case when v2.recommender_id is null then 0 else v2.capital end as recommended_capital
into #sum
--�Ƽ���
from (select distinct recommender_id  as member_id from #member_recommended ) a 
left outer join #member_sixten aa on a.member_id=aa.member_id
-- �û���Ϣ
left outer join member b on a.member_id=b.id  
--����
left outer join (select member_id,sum(award) as award from #award where atype='six' group by member_id) aw1 on a.member_id = aw1.member_id
left outer join (select member_id,sum(award) as award from #award where atype='ten' group by member_id) aw2 on a.member_id = aw2.member_id
left outer join (select member_id,sum(award) as award from #award where atype='recommend' group by member_id) aw3 on a.member_id = aw3.member_id
--�Ƽ�����
left outer join (select recommender_id,count(distinct member_id) as recommendeds from #member_recommended group by recommender_id) c on a.member_id=c.recommender_id
--�Ƽ���Ͷ��
left outer join (select member_id,sum(capital) as capital from #recommender_invest group by member_id) v1 on a.member_id=v1.member_id
--���Ƽ���Ͷ��
left outer join (select recommender_id,count(distinct member_id) as recommendeds,sum(capital) as capital from #recommender_recommended_invest group by recommender_id) v2 on a.member_id=v2.recommender_id

select member_id as �Ƽ���id
,is_six as �Ƿ����ѽ���
,is_ten as �Ƿ�ʮ�˽���
,rtype as �Ƽ��˽�������
,reg_day as �Ƽ���ע������
,award_six as ���ѽ���
,award_ten as ʮ�˽���
,award_recommend as �Ƽ�����
,(award_six+award_ten+award_recommend) as �Ƽ��ܽ���
,recommender_capital as �Ƽ���Ͷ����
,recommendeds as ���Ƽ�����
,recommendeds_invest as ���Ƽ���Ͷ������
,recommended_capital as ���Ƽ��˵�Ͷ����
from #sum
where is_six=1 or is_ten=1

select rtype as �Ƽ�������
,count(1) as '�Ƽ�������'
,sum(award_six) as ���ѽ���
,sum(award_ten) as ʮ�˽���
,sum(award_recommend) as �Ƽ�����
,sum(award_six+award_ten+award_recommend) as �Ƽ��ܽ���
,sum(recommender_capital) as �Ƽ���Ͷ����
,sum(recommendeds) as ���Ƽ�����
,sum(recommendeds_invest) as ���Ƽ���Ͷ������
,sum(recommended_capital) as ���Ƽ��˵�Ͷ����
from #sum 
group by rtype