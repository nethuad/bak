


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



select * 
from Transfer_Detail 
where capital_type =  14


--����������Բο�����Щ�û��μ��˻
select top 10 * from Lottery_Award a
select * from Lottery_Chance


--����Լ���Ϣȯ
card_coupons_detail

select id,amount,batch_desc,* from card_coupons_batch where batch_desc like '18�괺�ڻ%'
--323	800.00	18�괺�ڻ800Ԫ���
--324	600.00	18�괺�ڻ600Ԫ���
--325	518.00	18�괺�ڻ518Ԫ���
--326	30.00	18�괺�ڻ30Ԫ���
--327	80.00	18�괺�ڻ80Ԫ���
--328	1000000.00	18�괺�ڻ1����Ϣȯ
--329	1000000.00	18�괺�ڻ2����Ϣȯ

select top 10 * 
from card_coupons_detail 
where batch_id in (323,324,325,326,327,328,329)



select  CONVERT(varchar(10) , date_created, 120 ) as d
,count(1) as c 
from card_coupons_detail 
where batch_id in (323,324,325,326,327,328,329)
and member_id is not null
group by CONVERT(varchar(10) , date_created, 120 )
order by d


select  batch_id
,count(1) as c 
from card_coupons_detail 
where batch_id in (323,324,325,326,327,328,329)
and member_id is not null
group by batch_id


select  CONVERT(varchar(10) , date_created, 120 ) as d
,count(1) as c 
from card_coupons_detail 
where batch_id in (323,324,325,326,327,328,329)
and member_id is not null
group by CONVERT(varchar(10) , date_created, 120 )
order by d


use xueshandai

drop table #1
select date_created,member_id,batch_id,amount,status
,case when use_to is not null then 1 else 0 end as is_used
,invest_id
into #1
from card_coupons_detail a 
where batch_id in (323,324,325,326,327,328,329)
and member_id is not null

union all
--�ֽ�
select date_created,receiver_id as member_id,21 as batch_id,capital as amount,1 as status,1 as is_used,null as invest_id
from Transfer_Detail 
where capital_type=21

union all

--����
select issued_time as date_created,member_id,22 as batch_id,change as amount,1 as status,1 as is_used,null as invest_id
from integral_detail 
where 1=1
--where member_id in (select investor_id from lottery_award where lottery_chance_id in ( select id from lottery_chance where award_type='26' and prize_seq='10')) 
and description like '%�μ�ӭ�´�����������1800����'



select CONVERT(varchar(10) , date_created, 120 ) as d
,member_id
,batch_id
,case when a.batch_id=21 then case when amount=398 then '398Ԫ�ֽ�' when amount=218 then '218Ԫ�ֽ�' end
when a.batch_id=22 then '1800����'
else b.batch_desc end as batch_desc 
,amount
,status
,is_used 
,invest_id
into #2 
from #1 a 
left outer join (select id,batch_desc from card_coupons_batch where batch_desc like '18�괺�ڻ%') b on a.batch_id=b.id

select count(distinct member_id) as c from #1
select count(distinct member_id) as c from #2

--�齱����
select c,count(1) as c2 from (
select member_id,count(1) as c from #2 group by member_id
) a group by c
order by c

--c	c2
1	883
2	212
3	144
4	110
5	122
6	114
7	658

ÿ��齱����
select d,batch_desc
,count(1) as c 
from #2 
group by d,batch_desc
order by d


�������Ϣȯʹ����
select batch_desc,count(1) as c ,sum(is_used) as used
from #2
group by batch_desc


select top 10  * from #2

select * from #2

select top 10 * from #1

 select * from lottery_chance where award_type='26' and prize_seq='10'

 select investor_id from lottery_award where lottery_chance_id in ( select id from lottery_chance where award_type='26' and prize_seq='10')
 
 select * from integral_detail 
 where 1=1
 --where member_id in (select investor_id from lottery_award where lottery_chance_id in ( select id from lottery_chance where award_type='26' and prize_seq='10')) 
 and description like '%�μ�ӭ�´�����������1800����'


select batch_id,status,is_used,count(1) as c from #1 
where is_used=1
group by batch_id,status,is_used






select CONVERT(varchar(10) , date_created, 120 ) as d
,case when a.batch_id=21 then case when amount=398 then '398Ԫ�ֽ�' when amount=218 then '218Ԫ�ֽ�' end
else b.batch_desc end as batch_desc 
,is_used
,count(1) as c
,count(distinct member_id) as members
from #1 a 
left outer join (select id,batch_desc from card_coupons_batch where batch_desc like '18�괺�ڻ%') b on a.batch_id=b.id
group by CONVERT(varchar(10) , date_created, 120 ),case when a.batch_id=21 then case when amount=398 then '398Ԫ�ֽ�' when amount=218 then '218Ԫ�ֽ�' end
else b.batch_desc end
,is_used



select 
case when a.batch_id=21 then case when amount=398 then '398Ԫ�ֽ�' when amount=218 then '218Ԫ�ֽ�' end
else b.batch_desc end as batch_desc 
,is_used
,count(1) as c
,count(distinct member_id) as members
from #1 a 
left outer join (select id,batch_desc from card_coupons_batch where batch_desc like '18�괺�ڻ%') b on a.batch_id=b.id
group by case when a.batch_id=21 then case when amount=398 then '398Ԫ�ֽ�' when amount=218 then '218Ԫ�ֽ�' end
else b.batch_desc end
,is_used


select * from #1


select member_id,count(1) as c from #1 group by member_id

select count(distinct member_id) as c from #1





select id,amount,batch_desc from card_coupons_batch where batch_desc like '18�괺�ڻ%'
