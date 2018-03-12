use xueshandai

select * from new_comer_borrow


select * from new_comer_borrow_invest where member_id=980723

select does_use_status,count(1) as c ,count(distinct member_id) as c2,sum(get_interest) as get_interest  
from new_comer_borrow_invest group by does_use_status order by does_use_status  
0	264035	264035	
1	2880	2880	28396.80
2	87980	87980	869647.60
3	73077	73077	
--0-NOT_USE("未使用"), 1-USE("已使用"), 2-DONE("奖励已发放"), 3-OVERDUE("已过期")

select 
CONVERT(varchar(7) , get_reward_time, 120 ) as ym
,count(1) as members,sum(amount) as amount
,sum(case when does_use_status =0 then 1 else 0 end) as members_notuse
,sum(case when does_use_status =1 then 1 else 0 end) as members_use
,sum(case when does_use_status =2 then 1 else 0 end) as members_done
,sum(case when does_use_status =3 then 1 else 0 end) as members_overdue

,sum(case when does_use_status =1 then amount else 0 end) as amount_use
,sum(case when does_use_status =2 then amount else 0 end) as amount_done

,sum(case when does_use_status =1 then get_interest else 0 end) as interest_use
,sum(case when does_use_status =2 then get_interest else 0 end) as interest_done

into portrait.dbo.rp_new_comer_borrow_invest
from new_comer_borrow_invest
group by CONVERT(varchar(7) , get_reward_time, 120 )

select ym as 年月,members as 发放人数,amount as 体验金,members_use+members_done as 使用人数,amount_use+amount_done as 使用体验金,interest_use+interest_done as 奖励 
,(interest_use+interest_done)/(members_use+members_done) as 人均奖励
,(members_use+members_done)*1.0/members as 使用人数占比
from portrait.dbo.rp_new_comer_borrow_invest
order by ym



 
   
   
