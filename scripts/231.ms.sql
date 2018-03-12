use xueshandai

-- 用户信息 member
status all=0 
select top 10 
* 
from member where uname='nethuad'

select reg_way,count(1) as c  from member group by reg_way order by c desc

select reg_way,count(1) as c  from member 
where year(reg_time)=2018
group by reg_way order by c desc

select year(reg_time) as reg_year,count(1) as c  from member group by year(reg_time)
--NULL	5
--2013	7439
--2014	23758
--2015	62417
--2016	178434
--2017	654509
--2018	2136

select year(reg_time) as reg_year,month(reg_time) as reg_month,count(1) as c  
from member
--where year(reg_time) >=2017
group by year(reg_time) ,month(reg_time)
order by reg_year,reg_month

--投标信息
select top 10 * from borrow_invest

select a.*,reg_way
from borrow_invest a 
inner join member b on a.investor_id = b.id
where 1=1
and investor_id=980723


select year(activate_time) as activate_year,invest_way,count(1) as c from borrow_invest 
group by year(activate_time),invest_way
order by invest_way,activate_year asc

select year(activate_time) as activate_year,
month(activate_time)  as activate_month,
invest_way,
count(1) as c from borrow_invest
where year(activate_time)>=2017
group by year(activate_time),month(activate_time),invest_way
order by activate_year asc,month(activate_time),c desc


select year(activate_time) as activate_year,
month(activate_time)  as activate_month,
invest_way,
reg_way,
count(1) as c 
from borrow_invest a 
inner join member b on a.investor_id = b.id
where year(activate_time)>=2018
group by year(activate_time),month(activate_time),reg_way,invest_way
order by activate_year asc,month(activate_time),c desc

select 
invest_way,
reg_way,
count(1) as c 
from borrow_invest a 
inner join member b on a.investor_id = b.id
where year(activate_time)>=2018
group by reg_way,invest_way
order by c desc 
order by activate_year asc,month(activate_time),c desc

select 
--invest_way,
year(reg_time) as reg_year,
count(1) as c 
from borrow_invest a 
inner join member b on a.investor_id = b.id
where year(activate_time)>=2018
group by year(reg_time)
order by c desc 
order by activate_year asc,month(activate_time),c desc


select 
--invest_way,
year(reg_time) as reg_year,
year(activate_time) as activate_year,
count(1) as c 
from borrow_invest a 
inner join member b on a.investor_id = b.id
--where year(activate_time)>=2018
group by year(reg_time),year(activate_time)


--查看注册用户的实名认证分布
select top 10 * from member

select year(reg_time) as reg_year,
is_valid_idcard,
count(1) as c  
from member
--where year(reg_time) >=2017
group by year(reg_time) ,
is_valid_idcard
order by year(reg_time) ,
is_valid_idcard

--实名认证
select top 10 * from member_credit where member_id=980723

select status,count(1) as c from member_credit group by status

--充值
select * from account_recharge where member_id=980723




select * from member where id=103010

select distinct is_vip from member





